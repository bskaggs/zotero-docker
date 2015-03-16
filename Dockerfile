FROM debian:latest
MAINTAINER bskaggs@acm.org

ENV ZOTERO_VERSION 4.0.26.1
ENV ZOTERO_UID 1000
ENV ZOTERO_GID 1000
ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates bzip2 \
    systemd \
    libx11-6 \
    libfreetype6 \
    libfontconfig \
    libxrender1 \
    libxext6 \
    libxdamage1 \
    libxcomposite1 \
    libasound2 \
    libdbus-glib-1-2 \
    libgtk2.0-0 \
    libxt6 \
  && groupadd -g ${ZOTERO_GID} zotero && useradd -m -g zotero -u ${ZOTERO_UID} zotero 

USER zotero
RUN  mkdir -p /home/zotero/.zotero && curl -SL https://download.zotero.org/standalone/${ZOTERO_VERSION}/Zotero-${ZOTERO_VERSION}_linux-x86_64.tar.bz2 | tar jxC /home/zotero
WORKDIR /home/zotero
VOLUME /home/zotero/.zotero
ENTRYPOINT ["/home/zotero/Zotero_linux-x86_64/zotero"]
