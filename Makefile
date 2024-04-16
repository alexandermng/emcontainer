CC = /opt/emsdk/upstream/emscripten/emcc
CFLAGS = -g -Os -sSIDE_MODULE=1

SRCDIR = .
OUTDIR = bin

TARGET = module

.PHONY: build clean
build: $(OUTDIR)/$(TARGET).wasm $(OUTDIR)/$(TARGET).wat

clean:
	rm -rf $(OUTDIR)/*

$(OUTDIR)/%.wasm: $(SRCDIR)/%.c
	@mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS) -o $@ $<

%.wat: %.wasm
	wasmtools print -o $@ $<