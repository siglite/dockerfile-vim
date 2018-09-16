#!/bin/bash

set -eu

Repo="$HOME/vim"
Version="${VERSION:-None}"
Prefix="${PREFIX:-None}"

# 存在しなければレポジトリを取得 / 存在したら更新
if [ ! -e "$Repo" ]; then
  echo "[INFO] Checkout vim repository."
  git clone -q https://github.com/vim/vim.git "$Repo" || exit $?
else
  echo "[INFO] Update vim repository."
  git -C "$Repo" checkout -q -B master origin/master || exit $?
  git -C "$Repo" pull -q || exit $?
fi

if [ "$Version" = "None" ]; then
  Version="$(git -C $Repo tag | sort -V | tail -n 1)"
  echo "[INFO] Select HEAD [$Version]"
else
  echo "[INFO] Select $Version"
  git -C "$Repo" checkout -q -B "build-$Version" "$Version" || exit $?
fi

if [ "$Prefix" = "None" ]; then
  Prefix="$HOME/local/stow/vim-$Version"
fi

# Show build variables
echo "[[[[[ BUILD ENV ]]]]]"
echo "[ Repo = $Repo ]"
echo "[ Version = $Version ]"
echo "[ Prefix = $Prefix ]"

# Building vim
cd "$Repo/src"
echo "[INFO] Build started!"
./configure \
  --prefix="$Prefix" \
  --enable-fail-if-missing \
  --with-features=huge \
  --enable-multibyte \
  --enable-acl \
  --enable-cscope \
  --enable-terminal \
  --without-x \
  --enable-gui=no \
  --enable-perlinterp \
  --enable-rubyinterp \
  --enable-luainterp \
  --enable-python3interp \
  --with-python3-config-dir=$(python3-config --configdir) \
  --disable-pythoninterp
make clean && make && make install
echo "[INFO] vim finished!"
