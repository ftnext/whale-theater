#!/usr/bin/env bash
set -eo pipefail

audio_path=$1
audio_file=$(basename "${audio_path}")
audio_directory=$(cd "$(dirname "${audio_path}")"; pwd -P)

if [ -z "$OPENAI_API_KEY" ]; then
  echo 'Error: Set environment variable `OPENAI_API_KEY`'
  exit 1
fi

docker run --rm \
  -e OPENAI_API_KEY \
  -v "${audio_directory}/${audio_file}:/work/${audio_file}" \
  ftnext/openai-transcribe "${audio_file}"
