FROM golang:1.12-alpine3.9 AS build
RUN apk add --no-cache git
WORKDIR /usr/src/gost
ARG GOST_VERSION=2.8.1
RUN wget -O - "https://github.com/ginuerzh/gost/archive/v${GOST_VERSION}.tar.gz" | tar xz
WORKDIR gost-${GOST_VERSION}
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags '-s -w' -o /gost ./cmd/gost

FROM scratch
COPY --from=build /gost /
ENTRYPOINT ["/gost"]
