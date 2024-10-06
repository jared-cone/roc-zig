#!/usr/bin/env bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

# Remove zig-out if it exists
if [ -d zig-out/ ]; then
  rm -rf zig-out/
fi

# Build with zig
zig build

# Re-package platform archives into prebuilt-platfrom
if [[ "$(uname)" == "Darwin" ]]; then
    rm -f platform/macos-arm64.o
    libtool -static -o platform/macos-arm64.o zig-out/lib/*
elif [[ "$(uname)" == "Linux" ]]; then
    rm -f platform/linux-x64.a

    # bust open each of the archives and repackage into new archive
    cd zig-out/lib/
    ar x libroc-host.a
    cd ../../
    ar rcs platform/linux-x64.a zig-out/lib/*.o
else
    echo "Unsupported operating system"
fi

roc dev --prebuilt-platform app.roc
