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
dnf install -y $(</setup/install) dnf-plugins-core
dnf build-dep -y $(</setup/install-build-dep) filesystem
dnf debuginfo-install -y $(</setup/install-debuginfo) filesystem
dnf clean all

PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin sh -eux /setup/pipx.sh

rm -r /setup
