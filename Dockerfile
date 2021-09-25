FROM golang:alpine AS builder

WORKDIR /app-be
COPY . .
RUN go build -o /rakamin-class-cicd-master

FROM alpine:latest
COPY --from=builder /rakamin-class-cicd-master /rakamin-class-cicd-master

CMD ["/rakamin-class-cicd-master"]
