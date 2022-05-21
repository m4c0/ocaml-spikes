type comparison = Less | Equal | Greater

module type ORDERED_TYPE = sig
  type t

  val compare : t -> t -> comparison
end

module Set (Elt : ORDERED_TYPE) = struct
  type element = Elt.t
  type set = element list

  let empty = []

  let rec add x s =
    match s with
    | [] -> [ x ]
    | hd :: tl -> (
        match Elt.compare x hd with
        | Equal -> s (* x is already in s *)
        | Less -> x :: s (* x is smaller than all elements of s *)
        | Greater -> hd :: add x tl)

  let rec member x s =
    match s with
    | [] -> false
    | hd :: tl -> (
        match Elt.compare x hd with
        | Equal -> true (* x belongs to s *)
        | Less -> false (* x is smaller than all elements of s *)
        | Greater -> member x tl)
end

module OrderedString = struct
  type t = string

  let compare x y = if x = y then Equal else if x < y then Less else Greater
end

module StringSet = Set (OrderedString)

module type SET = sig
  type element
  type set

  val empty : set
  val add : element -> set -> set
  val member : element -> set -> bool
end

module AbstractSet2 : functor (Elt : ORDERED_TYPE) ->
  SET with type element = Elt.t =
  Set

module ConcreteSet = AbstractSet2 (OrderedString)

let x = ConcreteSet.(add "gee" empty)
let y = StringSet.(add "gee" empty)
