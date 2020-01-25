FROM alpine

RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates

ADD https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl && \
kubectl version --client

ADD https://github.com/fluxcd/flux/releases/download/1.17.1/fluxctl_linux_amd64 /usr/local/bin/fluxctl
RUN chmod +x /usr/local/bin/fluxctl && \
fluxctl version

ENTRYPOINT /usr/local/bin/fluxctl