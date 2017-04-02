module type S = sig
  type 'a t
  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
end

module type UTIL = sig
  include S
  include Xcat_applicative.UTIL with type 'a t := 'a t
end

module type INFIX = sig
  include S
  include Xcat_applicative.INFIX with type 'a t := 'a t
  val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
end

module type S_TO_FUNCTOR =
  functor (M : S) -> Xcat_functor.S with type 'a t = 'a M.t

module type S_TO_APPLICATIVE =
  functor (M : S) -> Xcat_applicative.S with type 'a t = 'a M.t

module type S_TO_APPLICATIVE_UTIL =
  functor (M : S) -> Xcat_applicative.UTIL with type 'a t = 'a M.t

module type S_TO_INFIX =
  functor (M : S) -> INFIX with type 'a t = 'a M.t

module type S_TO_UTIL =
  functor (M : S) -> UTIL with type 'a t = 'a M.t
