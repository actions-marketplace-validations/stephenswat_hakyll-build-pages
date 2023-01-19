#!/bin/bash

set -o errexit

chown -R $(id -un):$(id -gn) ${GITHUB_WORKSPACE}
chown -R $(id -un):$(id -gn) /github/home/

stack --allow-different-user --resolver ${STACK_RESOLVER} build
stack --allow-different-user --resolver ${STACK_RESOLVER} run -- build
