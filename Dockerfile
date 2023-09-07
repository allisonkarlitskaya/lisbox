FROM registry.fedoraproject.org/fedora:39
ADD * /setup/
RUN sh -eux /setup/setup.sh
CMD /bin/bash
