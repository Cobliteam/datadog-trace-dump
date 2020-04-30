FROM alpine:3.9 AS builder

RUN apk add --no-cache perl perl-utils perl-dev make gcc musl-dev

RUN cpan install Carton

RUN mkdir -p /deps
WORKDIR /deps

COPY cpanfile* /deps/
RUN carton install

FROM alpine:3.9

RUN apk add --no-cache perl

COPY opentracing-dumper /usr/src/app/opentracing-dumper
COPY --from=builder /deps/local /usr/src/app/local

WORKDIR /usr/src/app

ENV PERL5LIB /usr/src/app/local/lib/perl5:/usr/src/app/local/lib/perl5/x86_64-linux-gnu

CMD ["./opentracing-dumper"]