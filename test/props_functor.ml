module type TESTABLE_FUNCTOR = sig
  type 'a t
  type e
  val arbitrary : e t QCheck.arbitrary
  val domain    : e QCheck.Observable.t
  val codomain  : e QCheck.arbitrary
  include Xcat_functor.S with type 'a t := 'a t
end

module MakeFunctorProperties =
  functor (F : TESTABLE_FUNCTOR) -> struct

    open Xcat_util

    let identity_law xs =
      F.map id xs = xs

    let composition_law f g xs =
      F.(map f (map g xs) = map (compose f g) xs)

    let identity =
      QCheck.(Test.make
                ~count:100
                F.arbitrary
                identity_law)

    let composition =
      QCheck.(Test.make
                ~count:100
                F.(triple arbitrary (fun1 domain codomain) (fun1 domain codomain))
                (fun (x, Fun (_, f), Fun (_, g)) -> composition_law f g x))
  end

module ListFunctorProperties =
  MakeFunctorProperties(struct
    include Xcat_instances.ListFunctor
    type e        = int
    let arbitrary = QCheck.(list int)
    let domain    = QCheck.Observable.int
    let codomain  = QCheck.int
  end)

let suite =
  [ ListFunctorProperties.identity
  ; ListFunctorProperties.composition
  ]
