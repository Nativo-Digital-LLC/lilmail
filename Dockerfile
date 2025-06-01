FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -o lilmail

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/lilmail .
COPY config.template.toml .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]