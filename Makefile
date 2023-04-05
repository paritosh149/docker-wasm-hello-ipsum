.PHONY: compile build run
compile: main.go
	docker run --rm -v ${PWD}:/home/tinygo \
	  tinygo/tinygo:0.27.0 \
	  tinygo build -target=wasm -o /home/tinygo/main.wasm

build: main.wasm Dockerfile
	docker build --platform wasi/wasm32 -t tsubasaogawa/docker-wasm-hello-ipsum .

run:
	docker run --rm \
	  --runtime=io.containerd.wasmedge.v1 \
	  --platform=wasi/wasm32 \
	  tsubasaogawa/docker-wasm-hello-ipsum:latest
