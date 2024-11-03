const fs = require("fs");
const bytes = fs.readFileSync(__dirname + "/twos_complement.wasm");

const input = parseInt(process.argv[2]);

(async () => {
  const obj = await WebAssembly.instantiate(new Uint8Array(bytes));

  ({ twos_complement } = obj.instance.exports);

  const result = twos_complement(input);

  console.log({ result });
})();
