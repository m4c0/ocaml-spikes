external hello : int -> int = "foo_echo"

let () = hello 99 |> print_int; print_newline ()
