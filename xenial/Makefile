NS = corbanr
REPO = ansible
VERSION ?= xenial 

default: push 

build:
	docker build --no-cache --pull --rm -t $(NS)/$(REPO):$(VERSION) -t $(NS)/$(REPO):latest .

push: build
	docker push $(NS)/$(REPO):$(VERSION)

latest: push
	docker push $(NS)/$(REPO):latest

.PHONY: build push latest
