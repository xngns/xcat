#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "xcat" @@ fun c ->
  Ok [ Pkg.mllib ~api:["Xcat"] "src/xcat.mllib";
       Pkg.mllib ~api:[] "src/xcat_top.mllib";
       Pkg.lib "src/xcat_top_init.ml";
       Pkg.test "test/main"; ]
