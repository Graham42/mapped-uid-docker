.PHONY: all alpine ubuntu

all: alpine ubuntu

alpine:
	docker build -t mapped-uid-docker:alpine -f Dockerfile.alpine .
	docker build -t mapped-uid-docker:latest -f Dockerfile.alpine .

ubuntu:
	docker build -t mapped-uid-docker:ubuntu -f Dockerfile.ubuntu .
