#!/usr/bin/env bash
set -euo pipefail

# 必要环境变量校验
: "${DB_HOST:?DB_HOST is required}"
: "${DB_USER:?DB_USER is required}"
: "${DB_PASSWORD:?DB_PASSWORD is required}"
DB_PORT="${DB_PORT:-5432}"
DB_SSLMODE="${DB_SSLMODE:-disable}"
: "${DB_NAME:?DB_NAME is required}"
: "${MANIFEST:?MANIFEST is required}"
: "${SUBSTREAMS_API_TOKEN:?SUBSTREAMS_API_TOKEN is required}"

# 组装 DSN
DSN="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=${DB_SSLMODE}"

MARKER_DIR="/var/lib/substreams"
MARKER_FILE="${MARKER_DIR}/setup_done"
mkdir -p "${MARKER_DIR}"

echo "[entrypoint] Using DSN: ${DSN}"
echo "[entrypoint] Using manifest: ${MANIFEST}"

# 简单等待 DB 可达（可调次数与间隔）
RETRIES="${DB_WAIT_RETRIES:-30}"
SLEEP="${DB_WAIT_SLEEP_SEC:-2}"
echo "[entrypoint] Waiting for database ${DB_HOST}:${DB_PORT}..."
for i in $(seq 1 "$RETRIES"); do
  if echo > "/dev/tcp/${DB_HOST}/${DB_PORT}" >/dev/null 2>&1; then
    echo "[entrypoint] Database is reachable."
    break
  fi
  echo "[entrypoint] DB not reachable yet, retry $i/${RETRIES}..."
  sleep "$SLEEP"
done

# 严格两步：仅在 RUN_MODE=setup 时执行 setup；默认 run
case "${RUN_MODE:-run}" in
  setup)
    echo "[entrypoint] RUN_MODE=setup, running setup and exiting..."
    substreams-sink-sql setup "${DSN}" "${MANIFEST}"
    exit 0
    ;;
  run)
    echo "[entrypoint] RUN_MODE=run, starting sink..."
    exec substreams-sink-sql run --on-module-hash-mistmatch=warn "${DSN}" "${MANIFEST}"
    ;;
  *)
    echo "[entrypoint] Unknown RUN_MODE=${RUN_MODE}, expected 'setup' or 'run'" >&2
    exit 1
    ;;
esac