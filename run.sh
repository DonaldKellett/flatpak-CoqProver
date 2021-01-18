#!/bin/sh

grep 'org.flatpak.CoqProver' ~/.bashrc > /dev/null
if [ $? -ne 0 ]
then
  cat ~/.bashrc /app/bashrc-append > ~/.org-flatpak-CoqProver-temp
  mv ~/.org-flatpak-CoqProver-temp ~/.bashrc
  mkdir -p ~/.local/bin
  mkdir -p ~/.local/lib
  for binfile in $(ls /app/bin)
  do
    cp /app/bin/$binfile ~/.local/bin/$binfile
  done
  for libfile in $(ls /app/lib)
  do
    cp -r /app/lib/$libfile ~/.local/lib/$libfile
  done
  echo 'org.flatpak.CoqProver has been initialized, please start a new session for the changes to take effect'
fi
$*
