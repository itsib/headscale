FROM docker.io/golang:1.23-bookworm AS build
ARG VERSION=dev
ENV GOPATH=/go
WORKDIR /go/src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN env

RUN CGO_ENABLED=0 GOOS=linux GOBIN=/go/bin go install \
    -ldflags="-s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=$VERSION" \
    ./cmd/headscale

#FROM ubuntu:22.04
#
#RUN mkdir -p /var/run/headscale
#
#COPY --from=build /usr/share/headscale /usr/bin

#ENTRYPOINT [ "/usr/local/bin/headscale" ]

#CMD ["headscale", "serve"]



#
#
#
#RUN apt-get update \
#  && apt-get install --no-install-recommends --yes less jq sqlite3 dnsutils \
#  && rm -rf /var/lib/apt/lists/* \
#  && apt-get clean
#RUN mkdir -p /var/run/headscale
#
#
#
#RUN CGO_ENABLED=0 GOOS=linux go install -ldflags="\
#    -s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=$VERSION" \
#    -a ./cmd/headscale
#
## Need to reset the entrypoint or everything will run as a busybox script
#ENTRYPOINT []
#EXPOSE 8080/tcp
#CMD ["headscale", "serve"]
