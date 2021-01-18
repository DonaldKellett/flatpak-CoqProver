#!/bin/sh

wget https://github.com/projectatomic/bubblewrap/releases/download/v0.4.1/bubblewrap-0.4.1.tar.xz
tar xvf bubblewrap-0.4.1.tar.xz
rm bubblewrap-0.4.1.tar.xz
cd bubblewrap-0.4.1
./configure --prefix=/app
make -j$(nproc)
make install
cd ..
rm -rf bubblewrap-0.4.1
wget https://github.com/ocaml/opam/releases/download/2.0.7/opam-2.0.7-x86_64-linux
install -D opam-2.0.7-x86_64-linux /app/bin/opam
rm opam-2.0.7-x86_64-linux
opam init -a --disable-sandboxing
eval $(opam env)
opam install coq.8.13.0 -y --destdir=/app
