#!/bin/bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

file=`pwd`/$1

echo $file > $ROOT_DIR/.picktmp