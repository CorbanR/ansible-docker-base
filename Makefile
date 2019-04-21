NS = corbanr
REPO = ansible
ANSIBLE_VERSION = 2.7
ANSIBLE_VERSION_MAX = 2.8

ALPINE_VERSION = 3.9
DEBIAN_VERSION = 9.8 # Stretch
UBUNTU_VERSION = 18.04 # Bionic

default: all-build

alpine:
	docker build --no-cache --pull --compress --rm  \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		--build-arg LIBSSL=openssl-dev \
		--build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) \
		--build-arg ANSIBLE_VERSION_MAX=$(ANSIBLE_VERSION_MAX) \
		-f Dockerfile.alpine \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-alpine$(ALPINE_VERSION) \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-alpine \
		-t $(NS)/$(REPO) .

debian:
	docker build --no-cache --pull --compress --rm  \
		--build-arg DEBIAN_VERSION=$(DEBIAN_VERSION) \
		--build-arg LIBSSL=libssl-dev \
		--build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) \
	  --build-arg ANSIBLE_VERSION_MAX=$(ANSIBLE_VERSION_MAX) \
		-f Dockerfile.debian \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-debian$(DEBIAN_VERSION) \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-debian .
ubuntu:
	docker build --no-cache --pull --compress --rm  \
		--build-arg UBUNTU_VERSION=$(UBUNTU_VERSION) \
		--build-arg LIBSSL=libssl-dev \
		--build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) \
	  --build-arg ANSIBLE_VERSION_MAX=$(ANSIBLE_VERSION_MAX) \
		-f Dockerfile.ubuntu \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-ubuntu$(UBUNTU_VERSION) \
		-t $(NS)/$(REPO):$(ANSIBLE_VERSION)-ubuntu .

alpine-push: alpine
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-alpine$(ALPINE_VERSION)
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-alpine
	docker push $(NS)/$(REPO)

debian-push: debian
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-debian$(DEBIAN_VERSION)
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-debian

ubuntu-push: ubuntu
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-ubuntu$(UBUNTU_VERSION)
	docker push $(NS)/$(REPO):$(ANSIBLE_VERSION)-ubuntu

all-build: alpine debian ubuntu
all-push: alpine-push debian-push ubuntu-push

.PHONY : all-build all-push
