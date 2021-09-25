FROM golang:alpine AS builder

RUN mkdir /app
COPY . /app
RUN make build -v -o main .

FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/main /app/
CMD ["/app/main"]