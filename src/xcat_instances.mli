module IdentityFunctor : sig
  type 'a t = 'a
  val map : ('a -> 'b) -> 'a -> 'b
end

module IdentityMonad : sig
  type 'a t = 'a
  val return : 'a -> 'a
  val bind : 'a -> ('a -> 'b) -> 'b
end

module IdentityApplicative : sig
  type 'a t = 'a
  val map : ('a -> 'b) -> 'a -> 'b
  val pure : 'a -> 'a
  val apply : ('a -> 'b) -> 'a -> 'b
end

module IdentityApplicativeInfix : sig
  type 'a t = 'a
  val pure : 'a -> 'a
  val apply : ('a -> 'b) -> 'a -> 'b
  val map : ('a -> 'b) -> 'a -> 'b
  val ( <$> ) : ('a -> 'b) -> 'a -> 'b
  val ( <$ ) : 'a -> 'b -> 'a
  val ( <*> ) : ('a -> 'b) -> 'a -> 'b
  val ( *> ) : 'a -> 'b -> 'b
  val ( <* ) : 'a -> 'b -> 'a
end

module IdentityApplicativeUtil : sig
  type 'a t = 'a
  val map : ('a -> 'b) -> 'a -> 'b
  val pure : 'a -> 'a
  val apply : ('a -> 'b) -> 'a -> 'b
  val whennn : bool -> unit -> unit
  val unless : bool -> unit -> unit
end

module ListFunctor : sig
  type 'a t = 'a list
  val map : ('a -> 'b) -> 'a t -> 'b t
end

module ListFunctorInfix : sig
  type 'a t = 'a list
  val map : ('a -> 'b) -> 'a t -> 'b t
  val ( <$> ) : ('a -> 'b) -> 'a t -> 'b t
  val ( <$ ) : 'a -> 'b t -> 'a t
end

module OptionFunctor : sig
  type 'a t = 'a option
  val map : ('a -> 'b) -> 'a t -> 'b t
end

module OptionApplicative : sig
  type 'a t = 'a option
  val map : ('a -> 'b) -> 'a t -> 'b t
  val pure : 'a -> 'a t
  val apply : ('a -> 'b) t -> 'a t -> 'b t
end

module OptionMonad : sig
  type 'a t = 'a option
  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
end

module OptionApplicativeInfix : sig
  type 'a t = 'a option
  val pure : 'a -> 'a t
  val apply : ('a -> 'b) t -> 'a t -> 'b t
  val map : ('a -> 'b) -> 'a t -> 'b t
  val ( <$> ) : ('a -> 'b) -> 'a t -> 'b t
  val ( <$ ) : 'a -> 'b t -> 'a t
  val ( <*> ) : ('a -> 'b) t -> 'a t -> 'b t
  val ( *> ) : 'a t -> 'b t -> 'b t
  val ( <* ) : 'a t -> 'b t -> 'a t
end
