#!/usr/bin/env bash

set -x


info()    { echo "[INFO]    $@" >&2 ; }
warning() { echo "[WARNING] $@" >&2 ; }
error()   { echo "[ERROR]   $@" >&2 ; }
fatal()   { echo "[FATAL]   $@" exit 1 ; }

cleanup() {
    # Remove temporary files
    rm -rf /tmp/tmp.tar
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT

    source_files=${1:-""}
    archive_name=${2:-""}

    if [ -z "$source_files" ]; then
        fatal "specify source files"
    fi

    if [ -z "$archive_name" ]; then
        fatal "specify archive name"
    fi

    tar -cf /tmp/tmp.tar $source_files && zstd -o "$archive_name" /tmp/tmp.tar

fi
