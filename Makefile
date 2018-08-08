IMAGE=slack-export-viewer
VERSION=latest
WORKDIR=/usr/src/app
PORT=8080

build:
	docker image pull ubuntu:18.04
	docker image build -t $(IMAGE):$(VERSION) .

run: build
	docker container run --rm \
		-p $(PORT):$(PORT) \
		-v "$(CURDIR)":$(WORKDIR) \
		$(IMAGE):$(VERSION)
