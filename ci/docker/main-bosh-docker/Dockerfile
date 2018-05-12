FROM ubuntu:xenial

ADD install.sh /tmp/install.sh
RUN /tmp/install.sh && rm /tmp/install.sh
ENV GOROOT /usr/local/go
ENV PATH $GOROOT/bin:$PATH

COPY bosh /usr/local/bin/
RUN chmod +x /usr/local/bin/bosh

# There is an implict assumption that ./bosh-deployment exists. If this was to run as a standalone it would fail
# @TODO add documentation to include a git clone of the `bosh-deployment`
COPY bosh-deployment /usr/local/bosh-deployment/

COPY start-bosh.sh /usr/local/bin/start-bosh
RUN chmod +x /usr/local/bin/start-bosh
