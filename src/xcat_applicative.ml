open Xcat_util

include Xcat_applicative_intf

module MakeFunctor : S_TO_FUNCTOR =
  functor (F : S) -> struct
    include F
  end

module MakeInfix : S_TO_INFIX =
  functor (F : S) -> struct
    type 'a t = 'a F.t
    module FI = Xcat_functor.MakeInfix(MakeFunctor(F))
    include (F  : S                  with type 'a t := 'a F.t)
    include (FI : Xcat_functor.INFIX with type 'a t := 'a F.t)
    let ( <*> )     = apply
    let ( <*  ) a b = const    <$> a <*> b
    let (  *> ) a b = const id <$> a <*> b
  end

module MakeUtil : S_TO_UTIL =
  functor (F : S) -> struct
    include F
    let whennn b m = if b then m else pure ()
    let unless b m = whennn (not b) m
  end
