open Xcat_util

include Xcat_functor_intf

module MakeInfix : S_TO_INFIX =
  functor (F : S) -> struct
    include F
    let (<$>)   = map
    let (<$ ) a = map (const a)
  end
