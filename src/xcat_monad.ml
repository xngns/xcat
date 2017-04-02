include Xcat_monad_intf

module MakeApplicative : S_TO_APPLICATIVE =
  functor (M : S) -> struct
    open M
    type 'a t = 'a M.t
    let map f x = bind x (fun x -> return (f x))
    let pure = return
    let apply mf mx = bind mf (fun f -> map f mx)
  end

module MakeFunctor : S_TO_FUNCTOR =
  functor (M : S) -> struct
    type 'a t = 'a M.t
    module A = MakeApplicative(M)
    include (A : Xcat_applicative.S with type 'a t := 'a M.t)
  end

module MakeInfix : S_TO_INFIX =
  functor (M : S) -> struct
    type 'a t = 'a M.t
    module AI = Xcat_applicative.MakeInfix(MakeApplicative(M))
    include (M  : S                      with type 'a t := 'a M.t)
    include (AI : Xcat_applicative.INFIX with type 'a t := 'a M.t)
    let (>>=) = bind
  end

module MakeUtil : S_TO_UTIL =
  functor (M : S) -> struct
    type 'a t = 'a M.t
    module AU = Xcat_applicative.MakeUtil(MakeApplicative(M))
    include (M  : S                     with type 'a t := 'a M.t)
    include (AU : Xcat_applicative.UTIL with type 'a t := 'a M.t)
  end
