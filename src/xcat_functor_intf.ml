open Xcat_util

module type S = sig
  type 'a t
  val map : ('a -> 'b) -> 'a t -> 'b t
end

module type INFIX = sig
  include S
  val (<$>) : ('a -> 'b) -> 'a t -> 'b t
  val (<$) : 'a -> 'b t -> 'a t
end

module type S_TO_INFIX =
  functor (F : S) -> INFIX with type 'a t = 'a F.t
