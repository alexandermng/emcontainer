# FROM mcr.microsoft.com/devcontainers/base:jammy
FROM mcr.microsoft.com/devcontainers/rust:latest

RUN apt-get update -y && apt-get install -y \
	git neovim tmux
	# cmake

ENV EMSDK_LOC /opt/emsdk
# ENV WABT_LOC /opt/wabt

RUN umask 0002 && \
	git clone https://github.com/emscripten-core/emsdk.git ${EMSDK_LOC} && cd ${EMSDK_LOC} && \
	./emsdk install latest && \
	chgrp -R vscode ${EMSDK_LOC}

RUN cargo install wasm-tools && \
	wasm-tools completion bash > /etc/bash_completion.d/wasm-tools
# RUN git clone --recursive https://github.com/WebAssembly/wabt ${WABT_LOC} && \
# 	cd ${WABT_LOC} && git submodule update --init && \
# 	make

ENV PATH="/opt/emsdk:/opt/emsdk/upstream/emscripten:${PATH}"