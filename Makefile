
VER=latest

all: build push
build:
	docker build --no-cache=true -t pound .
	docker tag -f pound docker.sunet.se/pound:$(VER)
update:
	docker build -t pound .
	docker tag -f pound docker.sunet.se/pound:$(VER)
push:
	docker push docker.sunet.se/pound:$(VER)
