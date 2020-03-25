CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
SHARD_BIN ?= ../../bin

bin:
	mkdir -p $(SHARD_BIN)
run_file:
	$(CRYSTAL_BIN) build ./bin/spec_mirror.cr -o $(SHARD_BIN)/spec_mirror --release
