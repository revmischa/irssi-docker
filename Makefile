.PHONY: build run

build:
	docker build --tag revmischa/irssi .

run: build
	docker run -ti revmischa/irssi

screen: build
	docker run -ti revmischa/irssi screen irssi
