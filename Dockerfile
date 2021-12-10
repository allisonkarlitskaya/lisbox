FROM registry.fedoraproject.org/fedora:35
ADD setup.sh /
RUN sh -eux /setup.sh
CMD /usr/bin/fish
