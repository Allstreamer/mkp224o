#!/bin/bash

sudo apt install gcc libc6-dev libsodium-dev make autoconf neovim tmux build-essential

./autogen.sh
flags=( "--enable-ref10" "--enable-amd64-51-30k" "--enable-amd64-64-24k" "--enable-donna" "--enable-donna-sse2" )

for flag in "${flags[@]}"
do
  ./configure $flag --enable-intfilter=64
  make clean
  make
  mv ./mkp224o ../gen${flag}
done
make clean
