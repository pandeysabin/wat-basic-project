const fs = require("fs");
const bytes = fs.readFileSync(__dirname + "/strings.wasm");

let memory = new WebAssembly.Memory({ initial: 1 });

const max_mem = 65535;

let importObject = {
  env: {
    buffer: memory,
    null_str: (str_pos) => {
      let bytes = new Uint8Array(memory.buffer, str_pos, max_mem - str_pos);

      let log_string = new TextDecoder("utf8").decode(bytes);
      log_string = log_string.split("\0")[0];
      console.log(log_string);
    },
    str_pos_len: (str_pos, str_len) => {
      const bytes = new Uint8Array(memory.buffer, str_pos, str_len);
      const log_string = new TextDecoder("utf8").decode(bytes);
      console.log(log_string);
    },
    len_prefix: (str_pos) => {
      const str_len = new Uint8Array(memory.buffer, str_pos, 1)[0];

      console.log({ str_len });
      const bytes = new Uint8Array(memory.buffer, str_pos + 1, str_len);
      const log_string = new TextDecoder("utf8").decode(bytes);
      console.log(log_string);
    },
  },
};

(async () => {
  let obj = await WebAssembly.instantiate(new Uint8Array(bytes), importObject);

  let main = obj.instance.exports.main;

  main();
})();
