packages='
  chromium
  curl
  dbus-daemon
  expect
  fedora-packager
  fish
  gdb
  git
  glibc-langpack-de
  glibc-langpack-en
  gnupg
  less
  libvirt-client
  libvirt-daemon-driver-qemu
  neofetch
  neovim
  npm
  opensc
  pcsc-lite-devel
  procps
  python3-argcomplete
  python3-devel
  python3-libvirt
  python3-pillow
  python3-pycodestyle
  python3-pyflakes
  python3-yaml
  qemu-img
  qemu-kvm
  sassc
  socat
  strace
  sudo
  swig
  valgrind
  virt-install
  wget
'

dnf update -y
dnf install -y dnf-plugins-core
dnf build-dep -y cockpit
dnf install --setopt=install_weak_deps=False -y ${packages}
ln -Tsf host/run/pcscd /run/pcscd
