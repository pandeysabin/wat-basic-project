(module
    (import "env" "print_string" (func $print_string (param i32 )))
    (import "env" "buffer" (memory 1))

    (global $start_string (import "env" "start_string") i32)
    (global $string_len i32 (i32.const 12))

    (data (global.get $start_string) "hello world!")

    (func (export "helloworld")
        (call $print_string(global.get $string_len))
    )
)