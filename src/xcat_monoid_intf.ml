module type S = sig
  type t
  val mult : t -> t -> t
  val unit : t
end
