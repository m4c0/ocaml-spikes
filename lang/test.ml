module Example = Example

(* ORD_TYPE *)
module type S = sig
  type t

  val to_string : t -> string
end

(* Set *)
module M (LeS : S) = struct
  let to_str = LeS.to_string
end

(* OrdStr *)
module IntS = struct
  type t = int

  let to_string = string_of_int
end

module IntM = M (IntS)

let () = IntM.to_str 1 |> print_endline
