FROM registry.fedoraproject.org/fedora:38
ADD * /setup/
RUN sh -eux /setup/setup.sh
CMD /bin/bash
