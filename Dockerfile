FROM golang:1.13 AS builder

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64

WORKDIR /go/src/app

# Fetch dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN ls -l
RUN go build \
  -a \
  -ldflags "-s -w -extldflags 'static'" \
  -installsuffix cgo \
  -tags netgo \
  -o /bin/vault-init \
  .

FROM scratch
ADD https://curl.haxx.se/ca/cacert.pem /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /bin/vault-init /
CMD ["/vault-init"]
