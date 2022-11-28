build:
	docker build -t ivoputzer/xmrig:latest .
run:
	docker run --name=xmrig --privileged --rm -v /tmp/hugepages:/dev/hugepages:rw -it ivoputzer/xmrig  --keepalive --coin=monero --url=pool.supportxmr.com:3333 --pass=$(worker) --user=$(address)
publish:
	docker push ivoputzer/xmrig:latest
