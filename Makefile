CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
PREFIX ?= /usr/local
SHARD_BIN ?= ../../bin

build: bin/spec_mirror
bin/spec_mirror:
	$(SHARDS_BIN) build $(CRFLAGS)
bin: build
	mkdir -p $(SHARD_BIN)
run_file:
	cp -n ./bin/spec_mirror.cr $(SHARD_BIN) || true