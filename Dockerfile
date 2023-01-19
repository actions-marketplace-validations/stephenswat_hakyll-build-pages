ARG GHC_VERSION
ARG SNAPSHOT_VERSION

FROM haskell:${GHC_VERSION}

ARG SNAPSHOT_VERSION

ENV STACK_RESOLVER=${SNAPSHOT_VERSION}
ENV STACK_ROOT=/root/.stack

RUN stack --resolver $STACK_RESOLVER update
RUN stack --resolver $STACK_RESOLVER install --fast hakyll

COPY entrypoint.sh /entrypoint.sh

RUN chmod -R 777 $STACK_ROOT

ENTRYPOINT ["/entrypoint.sh"]
