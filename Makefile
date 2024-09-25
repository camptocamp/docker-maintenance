GIT_HEAD_ARG = --build-arg=GIT_HEAD=$(shell git rev-parse HEAD)

.PHONY: build
build:
	# Required and not nesseerly exists
	touch CI.asc

	docker build $(GIT_HEAD_ARG) .
