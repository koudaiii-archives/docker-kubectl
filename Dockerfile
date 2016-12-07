FROM alpine:3.4

ENV KUBECTL_VERSION v1.4.5
ENV EDITOR vim

RUN apk add --no-cache --update ca-certificates wget curl bash vim \
  && wget -qO /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
  && chmod +x /usr/local/bin/kubectl \
  && apk del --purge wget \
  && rm /var/cache/apk/*

RUN apk add --no-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            emacs

ENTRYPOINT ["/usr/local/bin/kubectl"]
CMD ["help"]
