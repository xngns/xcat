module type S = sig
  include Xcat_functor.S
  include Xcat_foldable.S with type 'a t := 'a t
  type 'a f
  val traverse : ('a -> 'b f) -> 'a t -> 'b t f
  val sequence : 'a f t -> 'a t f
end
