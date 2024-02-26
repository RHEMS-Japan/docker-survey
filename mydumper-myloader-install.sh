#!/bin/bash

# mydumper and myloader from https://github.com/mydumper/mydumper

echo "Installing mydumper"
cd /tmp || exit
#  Platform  check
if uname -a | grep "x86_64 GNU/Linux"; then
  export SYS_ENV_PLATFORM=linux_x86
elif uname -a | grep "aarch64 GNU/Linux"; then
  export SYS_ENV_PLATFORM=linux_arm
else
  echo "This platform appears to be unsupported."
  uname -a
  exit 1
fi

echo "Platform: $SYS_ENV_PLATFORM"

case $SYS_ENV_PLATFORM in
linux_x86)
  echo "Installing mydumper x86"
  release=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/mydumper/mydumper/releases/latest | cut -d'/' -f8)
  wget https://github.com/mydumper/mydumper/releases/download/${release}/mydumper_${release:1}.$(lsb_release -cs)_amd64.deb
  dpkg -i mydumper_${release:1}.$(lsb_release -cs)_amd64.deb
  ;;
linux_arm)
  echo "Installing mydumper arm"
  apt-get install -y --no-install-recommends build-essential cmake libglib2.0-dev libmysqlclient-dev zlib1g-dev
  release=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/mydumper/mydumper/releases/latest | cut -d'/' -f8)
  wget https://github.com/mydumper/mydumper/archive/refs/tags/${release}.tar.gz
  tar -xvf ${release}.tar.gz
  cd "mydumper-${release:1}"
  cmake . -DWITH_MYSQL_CONFIG=/usr/bin/mysql_config -DCMAKE_INSTALL_PREFIX=/usr
  make
  make install
  cd ..
  rm "mydumper-${release:1}" "${release}.tar.gz"
  apt-get remove -y --purge build-essential cmake
  ;;
*)
  echo "no support your platform"
  exit 1
  ;;
esac
