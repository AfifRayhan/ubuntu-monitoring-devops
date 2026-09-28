#!/bin/bash

set -e

echo "Starting build..."

rm -rf dist
mkdir -p dist

cp -r src dist/
cp -r tests dist/

tar -czf monitoring-ci-build.tar.gz -C dist .

echo "Build completed successfully."
echo "Generated artifact:"
ls -lh monitoring-ci-build.tar.gz
