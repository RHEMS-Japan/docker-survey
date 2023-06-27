#!/bin/bash

echo "Installing kubectl v2"
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
  echo "Installing kubectl x86"
  curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl
  ;;
linux_arm)
  echo "Installing kubectl arm"
  curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/arm64/kubectl" && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl
  ;;
*)
  echo "no support your platform"
  exit 1
  ;;
esac

source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
source ~/.bashrc
