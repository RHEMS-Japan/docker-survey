#!/bin/bash

echo "Installing AWS CLI v2"
cd /tmp || exit
# Platform check
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
  curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64${AWS_CLI_VER_STRING}.zip" -o "awscliv2.zip"
  unzip -q -o awscliv2.zip
  $SUDO ./aws/install
  rm awscliv2.zip
  ;;
linux_arm)
  curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-aarch64${AWS_CLI_VER_STRING}.zip" -o "awscliv2.zip"
  unzip -q -o awscliv2.zip
  $SUDO ./aws/install
  rm awscliv2.zip
  ;;
*)
  echo "no support your platform"
  exit 1
  ;;
esac
