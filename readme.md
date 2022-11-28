# docker-[xmrig](https://github.com/xmrig/xmrig) (alpine)

Easy way to mine [Monero](https://www.getmonero.org/) (XMR) directly on docker!

```sh
POOL=pool.supportxmr.com:3333
WORKER=docker
ADDRESS=84JcYfBGkZZMu8VGLum1x7Z1guC64JE1CZvUTAxbWVDoYfQoogUXd3FeJaFnSzAayCKG4BQtafYutCM2izXcx75rUnEYBKJ

docker run --name=xmrig --privileged --rm -v /tmp/hugepages:/dev/hugepages:rw -it ivoputzer/xmrig --keepalive --coin=monero --url=${POOL} --pass=${worker} --user=${ADDRESS}
```

### Resources 🚀
- https://hub.docker.com/r/ivoputzer/xmrig
- https://xmrig.com/docs/miner/build/alpine
