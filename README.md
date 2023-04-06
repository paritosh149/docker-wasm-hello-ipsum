# docker-wasm-hello-ipsum

Run WASM container written in Go on Docker Desktop

```bash
$ make run
docker run --rm \
  --runtime=io.containerd.wasmedge.v1 \
  --platform=wasi/wasm32 \
  tsubasaogawa/docker-wasm-hello-ipsum:latest
Hello Ipsum
```

## Environments

- Go 1.20
- Docker Desktop v4.15+
- Make

## Usage

```bash
# Generate wasm
$ make compile

# Create wasm container
$ make build

# Run wasm container
$ make run
```
