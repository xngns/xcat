module IdentityFunctor = struct
  type 'a t = 'a
  let map f x = f x
end

module IdentityMonad = struct
  type 'a t = 'a
  let return x = x
  let bind x f = f x
end

module IdentityApplicative      = Xcat_monad.MakeApplicative(IdentityMonad)
module IdentityApplicativeInfix = Xcat_applicative.MakeInfix(IdentityApplicative)
module IdentityApplicativeUtil  = Xcat_applicative.MakeUtil(IdentityApplicative)

module ListFunctor = struct
  type 'a t = 'a list
  let map = List.map
end

module ListFunctorInfix = Xcat_functor.MakeInfix(ListFunctor)

module OptionFunctor = struct
  type 'a t = 'a option
  let map f m =
    match m with
    | Some x -> Some (f x)
    | None   -> None
end

module OptionApplicative = struct
  include OptionFunctor
  let pure x = Some x
  let apply a b =
    match a with
    | Some f -> map f b
    | None   -> None
end

module OptionMonad = struct
  type 'a t = 'a option
  let return x = Some x
  let bind a k =
    match a with
    | Some x -> k x
    | None   -> None
end

module OptionApplicativeInfix = Xcat_applicative.MakeInfix(OptionApplicative)
