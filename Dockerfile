ARG GHC_VERSION
ARG SNAPSHOT_VERSION

FROM haskell:${GHC_VERSION}

ARG SNAPSHOT_VERSION

ENV STACK_RESOLVER=${SNAPSHOT_VERSION}

RUN stack --resolver $STACK_RESOLVER update
RUN stack --resolver $STACK_RESOLVER install hakyll

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
