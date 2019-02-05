## === change application name and git repository 
ARG ApplicationName=cowboy_hello
ARG GitUrl="https://github.com/aramyazdanpanah/cowboy_hello"

## === select erlang version for compile 
ARG ErlangTag=20.3.8-alpine
ARG AlpineVersion=latest

## === use erlang image for build application
FROM erlang:${ErlangTag} as builder
ARG GitUrl
ARG ApplicationName 
RUN apk update && \
    apk add git && \
    apk add make
RUN git clone ${GitUrl}
WORKDIR ${ApplicationName}
RUN make proto && \ 
    make rel-stage

## === use alpine and install dependeny for run application
FROM alpine:${AlpineVersion}
ARG ApplicationName 
RUN apk update && \
    apk add ncurses-libs && \
    apk add libssl1.0 

COPY --from=builder /${ApplicationName}/_build/stage/rel/${ApplicationName} /code
WORKDIR /code 
RUN mv bin/${ApplicationName} bin/application
CMD ["bin/application", "foreground"]
