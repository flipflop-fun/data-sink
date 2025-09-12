FROM golang:1.22-alpine AS builder
RUN apk add --no-cache git ca-certificates && update-ca-certificates
ENV CGO_ENABLED=0 GO111MODULE=on GOTOOLCHAIN=auto
WORKDIR /src
RUN git clone --depth 1 --branch v4.6.7 https://github.com/streamingfast/substreams-sink-sql.git .
RUN go build -o /out/substreams-sink-sql ./cmd/substreams-sink-sql

FROM alpine:3.19
RUN apk add --no-cache ca-certificates bash curl tini && update-ca-certificates
COPY --from=builder /out/substreams-sink-sql /usr/local/bin/substreams-sink-sql
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
WORKDIR /app
ENTRYPOINT ["/sbin/tini","--","/entrypoint.sh"]