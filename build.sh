#!/usr/bin/env sh

if [ -n "$1" ]; then
  REPO_DIR=$1
else
  REPO_DIR=$(dirname "$(realpath "$0")")
fi

rm -f "$REPO_DIR"/target/scala-*/Eldarica-assembly-*jar && echo "Removed old jar files"

cd "$REPO_DIR" || exit

sbt assembly && echo "Eldarica successfully compiled."
