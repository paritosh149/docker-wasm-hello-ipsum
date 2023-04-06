TINYGO_VERSION := 0.27.0
RUNTIME := io.containerd.wasmedge.v1
IMAGE_TAG := tsubasaogawa/docker-wasm-hello-ipsum

.PHONY: debug compile build run

debug:
	docker run --rm -v ${PWD}:/home/tinygo \
	  tinygo/tinygo:${TINYGO_VERSION} \
	  tinygo run /home/tinygo/

compile: main.go
	docker run --rm -v ${PWD}:/home/tinygo \
	  tinygo/tinygo:${TINYGO_VERSION} \
	  tinygo build -target=wasi -o /home/tinygo/main.wasm

build: main.wasm Dockerfile
	docker buildx build --platform wasi/wasm -t ${IMAGE_TAG} .

run:
	docker run --rm \
	  --runtime=${RUNTIME} \
	  --platform=wasi/wasm \
	  ${IMAGE_TAG}:latest
