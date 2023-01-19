#!/bin/bash

set -o errexit

stack --allow-different-user --resolver ${STACK_RESOLVER} build
stack --allow-different-user --resolver ${STACK_RESOLVER} run -- build
