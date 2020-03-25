CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
PREFIX ?= /usr/local
SHARD_BIN ?= ../../bin

build: bin/spec_mirror
bin/spec_mirror:
	$(SHARDS_BIN) build $(CRFLAGS)
clean:
	rm -f ./bin/spec_mirror ./bin/spec_mirror.dwarf
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/spec_mirror $(PREFIX)/bin
bin: build
	mkdir -p $(SHARD_BIN)
run_file:
	cp -n ./bin/spec_mirror.cr $(SHARD_BIN) || true
	$(CRYSTAL_BIN) build $(SHARD_BIN)/spec_mirror.cr --release
test: build
	$(CRYSTAL_BIN) spec
	./bin/spec_mirror --all