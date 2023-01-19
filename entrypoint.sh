#!/bin/bash

set -o errexit

chown -R $(id -un):$(id -gn) ~

stack --resolver ${STACK_RESOLVER} build
stack --resolver ${STACK_RESOLVER} run -- build
