#!/bin/sh
envsubst < /app/config.template.toml > /app/config.toml
exec ./lilmail