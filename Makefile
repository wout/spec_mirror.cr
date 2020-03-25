CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
PREFIX ?= /usr/local
SHARD_BIN ?= ../../bin

build: bin/spec_mirror
bin: build
	mkdir -p $(SHARD_BIN)
	cp ./bin/spec_mirror.cr $(SHARD_BIN)
run_file:
	$(CRYSTAL_BIN) build $(SHARD_BIN)/spec_mirror.cr --release
