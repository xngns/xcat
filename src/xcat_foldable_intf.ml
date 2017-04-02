module type S = sig
  type 'a t
  val foldr : ('a -> 'b -> 'b) -> 'b -> 'a t -> 'b
end
