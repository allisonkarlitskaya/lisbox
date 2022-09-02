FROM registry.fedoraproject.org/fedora:37
ADD * /setup/
RUN sh -eux /setup/setup.sh
CMD /usr/bin/fish
