FROM alpine:3
ARG XMRIG_VERSION='v6.18.1'
WORKDIR /usr/src
RUN apk update \
 && apk add --no-cache build-base git cmake libuv-dev linux-headers libressl-dev \
 && apk add --no-cache hwloc-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY ./donations.patch /usr/src/donations.patch
RUN git clone --depth 1 --branch v6.18.1 https://github.com/xmrig/xmrig.git \
 && cd xmrig \
 && git apply ../donations.patch \
 && mkdir build \
 && cd build \
 && cmake .. -DCMAKE_BUILD_TYPE=Release \
 && make -j$(nproc)
FROM alpine:3
LABEL maintainer="Ivo von Putzer Reibegg <ivo.putzer@gmail.com>"
WORKDIR /usr/bin
COPY --from=0 /usr/src/xmrig/build/xmrig /usr/bin
RUN apk update \
 && apk add --no-cache libuv libressl \
 && apk add --no-cache hwloc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ENTRYPOINT [ "/usr/bin/xmrig" ]
