#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  let api =
    [ "Xcat_functor"
    ; "Xcat_applicative"
    ; "Xcat_monad"
    ; "Xcat_foldable"
    ; "Xcat_traversable"
    ; "Xcat_semigroup"
    ; "Xcat_monoid"
    ; "Xcat_instances"
    ; "Xcat_util"
    ; "Xcat"
    ]
  in
  Pkg.describe "xcat" @@ fun c ->
  Ok [ Pkg.mllib ~api:api "src/xcat.mllib";
       Pkg.test "test/main"; ]
