#!/bin/sh

export OPAMYES=1 OPAMVERBOSE=1
eval `opam config env`

echo Architecture
uname -a
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version

PREFIX=$HOME/.opam/$OCAML_VERSION

opam pin add .
opam install $(opam show -f depopts: . | sed -e 's/{.*}//g' -e 's/"//g')
opam install .
opam remove .
