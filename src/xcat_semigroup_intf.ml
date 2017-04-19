module type S = sig
  type t
  val mult : t -> t -> t
end
