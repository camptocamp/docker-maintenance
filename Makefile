GIT_HEAD_ARG = --build-arg=GIT_HEAD=$(shell git rev-parse HEAD)

.PHONY: build
build:
	# Required and not nesseerly exists
	touch CI.asc

	docker build $(GIT_HEAD_ARG) --tag=camptocamp/maintenance .

.PHONY: run
run: build
	docker stop --time=0 maintenance || true
	sleep .1
	docker run -d --name=maintenance --user=33 --rm --publish=8081:8080  camptocamp/maintenance
