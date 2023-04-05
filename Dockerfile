FROM scratch
COPY main.wasm /main.wasm
ENTRYPOINT [ "/main.wasm" ]
