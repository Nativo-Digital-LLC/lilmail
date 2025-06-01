#!/bin/sh
set -e

echo "Generando config.toml con variables de entorno..."

# exporta las variables que envsubst necesita
export IMAP_SERVER IMAP_PORT IMAP_TLS \
       CACHE_FOLDER JWT_SECRET ENCRYPTION_KEY \
       SMTP_SERVER SMTP_PORT SMTP_STARTTLS

# reemplaza las variables en el template
envsubst < /app/config.template.toml > /app/config.toml

echo "Config generado:"
cat /app/config.toml

exec ./lilmail