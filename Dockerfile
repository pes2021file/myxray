FROM alpine:3.20
RUN apk add --no-cache curl unzip && \
    curl -L -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/download/v25.3.6/Xray-linux-64.zip && \
    mkdir -p /usr/local/bin && unzip -o /tmp/x.zip xray -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && rm /tmp/x.zip
COPY config.json /usr/local/etc/xray.json
CMD ["/bin/sh", "-c", "sed -i \"s/__PORT__/$PORT/g\" /usr/local/etc/xray.json && /usr/local/bin/xray run -c /usr/local/etc/xray.json"]
