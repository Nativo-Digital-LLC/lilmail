FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o lilmail

FROM alpine:latest
WORKDIR /app

# Instala envsubst (viene con gettext)
RUN apk add --no-cache gettext

COPY --from=builder /app .
COPY config.template.toml .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]