FROM golang:alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init greeter && go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/greeter .
CMD ["./greeter"]