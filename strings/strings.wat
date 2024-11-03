(module
    ;; Imported JavaScript function (below) takes position and length
    (import "env" "str_pos_len" (func $str_pos_len (param i32 i32)))

    (import "env" "null_str" (func $null_str (param i32)))

    (import "env" "buffer" (memory 1))

    (data (i32.const 0) "null-terminating string\00")
    (data (i32.const 128) "another null-terminating string\00")


    ;; 30 character string
    (data (i32.const 256) "Know the length of this string")
    ;; 35 character string
    (data (i32.const 384) "Also know the length of this string")

    (func (export "main")
        (call $null_str (i32.const 0))
        (call $null_str (i32.const 128))
        
        ;; length of the first thing in 30 characters
        (call $str_pos_len (i32.const 256) (i32.const 30))
        ;; length of the second string is 35 characters
        (call $str_pos_len (i32.const 384) (i32.const 35))
    )
)