FROM alpine:3.6

ENV VER=2.11.0 METHOD=chacha20 PASSWORD=eyp7q12dgsmx8jnekkhp
ENV TLS_PORT=443

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT}

CMD exec /gost/gost -L ws://$METHOD:$PASSWORD@:${TLS_PORT}

