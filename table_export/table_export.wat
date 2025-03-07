(module
    (import "js" "increment" (func $js_increment (result i32)))
    (import "js" "decrement" (func $js_decrement (result i32)))

    (table $tbl (export "tbl") 4 anyfunc)

    (global $i (mut i32) (i32.const 0))

    (func $increment (export "increment") (result i32)
        (global.set $i (i32.add (global.get $i) (i32.const 1)))
        global.get $i
    )

    (func $decrement (export "decrement") (result i32)
        (global.set $i (i32.sub (global.get $i) (i32.const 1)))
        global.get $i
    )

    (elem (i32.const 0) $js_increment $js_decrement $increment $decrement)
)