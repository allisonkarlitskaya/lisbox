FROM registry.access.redhat.com/ubi8/ubi:latest
ADD * /setup/
RUN sh -eux /setup/setup.sh
CMD /bin/bash
