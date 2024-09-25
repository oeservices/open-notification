FROM golang:alpine AS builder

WORKDIR /build

COPY . .

RUN go mod download

RUN go build -o backend ./cmd/server

FROM scratch

COPY --from=builder /build/backend /

ENTRYPOINT ["./backend"]