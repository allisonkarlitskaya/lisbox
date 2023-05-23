dnf update -y
dnf install -y dnf-plugins-core python3
dnf install -y $(</setup/install)
python3 -m pip install $(</setup/install-pypi)

dnf clean all
rm -r /setup
