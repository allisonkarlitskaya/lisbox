FROM registry.fedoraproject.org/fedora:35
ADD * /setup/
RUN sh -eux /setup/setup.sh
CMD /usr/bin/fish
