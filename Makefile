.PHONY: all alpine ubuntu

all: alpine ubuntu

alpine:
	docker build -t mapped-uid-docker:alpine -f alpine/Dockerfile .
	docker build -t mapped-uid-docker:latest -f alpine/Dockerfile .

ubuntu:
	docker build -t mapped-uid-docker:ubuntu -f ubuntu/Dockerfile .
