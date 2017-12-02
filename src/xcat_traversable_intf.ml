module type S = sig
  type 'a t
  type 'a f
  include Xcat_functor.S  with type 'a t := 'a t
  include Xcat_foldable.S with type 'a t := 'a t
  val traverse : ('a -> 'b f) -> 'a t -> 'b t f
  val sequence : 'a f t -> 'a t f
end
