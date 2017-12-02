#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "xcat" @@ fun c ->
  Ok [ Pkg.mllib ~api:["Xcat"] "src/xcat.mllib";
       Pkg.test "test/main"; ]
