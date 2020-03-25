CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
SHARD_BIN ?= ../../bin

build: bin/spec_mirror
bin/spec_mirror:
	$(SHARDS_BIN) build $(CRFLAGS)
clean:
	rm -f ./bin/spec_mirror ./bin/spec_mirror.dwarf
bin: build
	mkdir -p $(SHARD_BIN)
run_file:
	$(CRYSTAL_BIN) build ./bin/spec_mirror.cr -o ./bin/spec_mirror --release
	cp -n ./bin/spec_mirror $(SHARD_BIN) || true