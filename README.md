xcat — 
-------------------------------------------------------------------------------
%%VERSION%%

xcat is TODO

xcat is distributed under the ISC license.

Homepage: https://github.com/xngns/xcat

## Installation

xcat can be installed with `opam`:

    opam install xcat

If you don't use `opam` consult the [`opam`](opam) file for build
instructions.

## Documentation

The documentation and API reference is generated from the source
interfaces. It can be consulted [online][doc] or via `odig doc
xcat`.

[doc]: https://xngns.github.io/xcat/doc

## Sample programs

If you installed xcat with `opam` sample programs are located in
the directory `opam var xcat:doc`.

In the distribution sample programs and tests are located in the
[`test`](test) directory. They can be built and run
with:

    topkg build --tests true && topkg test 
