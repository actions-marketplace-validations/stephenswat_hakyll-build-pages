#!/bin/bash

set -o errexit

stack --resolver ${STACK_RESOLVER} build
stack --resolver ${STACK_RESOLVER} run -- build
