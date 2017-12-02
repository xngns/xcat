module type S = sig
  type 'a t
  include Xcat_functor.S with type 'a t := 'a t
  val pure : 'a -> 'a t
  val apply : ('a -> 'b) t -> 'a t -> 'b t
end

module type UTIL = sig
  type 'a t
  include S with type 'a t := 'a t
  val whennn : bool -> unit t -> unit t
  val unless : bool -> unit t -> unit t
end

module type INFIX = sig
  type 'a t
  include S                  with type 'a t := 'a t
  include Xcat_functor.INFIX with type 'a t := 'a t
  val ( <*> ) : ('a -> 'b) t -> 'a t -> 'b t
  val (  *> ) : 'a t -> 'b t -> 'b t
  val ( <*  ) : 'a t -> 'b t -> 'a t
end

module type S_TO_FUNCTOR =
  functor (F : S) -> Xcat_functor.S with type 'a t = 'a F.t

module type S_TO_INFIX =
  functor (F : S) -> INFIX with type 'a t = 'a F.t

module type S_TO_UTIL =
  functor (F : S) -> UTIL with type 'a t = 'a F.t
