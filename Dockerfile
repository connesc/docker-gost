FROM alpine:3.10 AS build
RUN apk add --no-cache curl
ARG GOST_VERSION=2.8.2
ARG PLATFORM=linux-amd64
RUN curl -L "https://github.com/ginuerzh/gost/releases/download/v${GOST_VERSION}/gost-${PLATFORM}-${GOST_VERSION}.gz" | zcat > /gost \
	&& chmod +x /gost

FROM scratch
COPY --from=build /gost /
ENTRYPOINT ["/gost"]
