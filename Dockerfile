FROM openjdk:13-alpine
LABEL author="hectorgonzalezbarata@gmail.com"

ARG VERSION=6.33.0

RUN apk add bash curl unzip

RUN curl -L -o pmd-bin-${VERSION}.zip https://github.com/pmd/pmd/releases/download/pmd_releases%2F${VERSION}/pmd-bin-${VERSION}.zip && \
        unzip pmd-bin-${VERSION}.zip && \
        rm pmd-bin-${VERSION}.zip

RUN mv /pmd-bin-${VERSION} /pmd
WORKDIR /pmd

USER nobody

ENTRYPOINT ["./bin/run.sh", "pmd"]