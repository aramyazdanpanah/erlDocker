ARG ErlangTag=20.3.8-alpine
ARG AlpineVersion=latest
ARG ApplicationName=cowboy_hello
ARG GitUrl="https://github.com/aramyazdanpanah/cowboy_hello"


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

FROM alpine:${AlpineVersion}
ARG ApplicationName 
RUN apk update && \
    apk add ncurses-libs && \
    apk add libssl1.0 

COPY --from=builder /${ApplicationName}/_build/stage/rel/${ApplicationName} /code
WORKDIR /code
CMD ["bin/cowboy_hello", "console"]

