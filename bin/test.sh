#!/bin/bash
source "$(dirname $0)/common.sh"
execute "docker build -f $ROOT_DIR/test/fedora.Dockerfile -t fedora.test $ROOT_DIR"
execute "docker build -f $ROOT_DIR/test/ubuntu.Dockerfile -t ubuntu.test $ROOT_DIR"
