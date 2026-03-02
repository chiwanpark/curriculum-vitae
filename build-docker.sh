#!/usr/bin/env bash
set -euo pipefail

IMAGE="${TEXLIVE_IMAGE:-texlive/texlive:latest}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"

mkdir -p "${BUILD_DIR}"

docker run --rm \
  -u "$(id -u)":"$(id -g)" \
  -v "${ROOT_DIR}:/work" \
  -w /work \
  "${IMAGE}" \
  latexmk -pdf -outdir=build curriculum-vitae.tex
