# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# install GRPC
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade && \
  apt-get -y install libgrpc-dev git vim --no-install-recommends && \
# cleanup
  apt-get autoremove -y && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install Godeps
RUN go get github.com/tools/godep
