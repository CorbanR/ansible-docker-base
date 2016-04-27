NS = corbanr
REPO = ansible
VERSION ?= trusty

default: push 

build:
	docker build --no-cache --pull --rm -t $(NS)/$(REPO):$(VERSION) .

push: build
	docker push $(NS)/$(REPO):$(VERSION)

.PHONY: build push
