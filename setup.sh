packages='
  bubblewrap
  chromium
  curl
  dbus-daemon
  expect
  fedora-packager
  fish
  flatpak
  flatpak-builder
  flatpak-spawn
  gdb
  git
  glibc-langpack-de
  glibc-langpack-en
  gnupg
  less
  libvirt-client
  libvirt-daemon-driver-qemu
  man
  man-db
  man-pages
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

# before anything else: re-enable install of manpages
sed -ie 's/\<nodocs\>//' /etc/dnf/dnf.conf
# reinstall system packages which should have had manpages
dnf reinstall -y $(rpm -qa --queryformat '%{NAME}[:%{FILENAMES}]\n' |
                   grep ':/usr/share/man/' | cut -f1 -d:)

# https://github.com/containers/toolbox/pull/640
cat > /usr/lib/rpm/macros.d/macros.toolbox <<EOF
%_netsharedpath /dev:/media:/mnt:/proc:/sys:/tmp:/var/lib/flatpak:/var/lib/libvirt
EOF

dnf update -y
dnf install -y dnf-plugins-core
dnf build-dep -y cockpit
dnf install --setopt=install_weak_deps=False -y ${packages}
ln -Tsf host/run/pcscd /run/pcscd
