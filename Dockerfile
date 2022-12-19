ARG BUILDPLATFORM
FROM ${BUILDPLATFORM}alpine:3

ARG VELERO_VERSION
ARG KUBE_VERSION
ARG IAM_AUTHENTICATOR_VERSION

ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache aws-cli vim tree

RUN wget -q https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${IAM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_${IAM_AUTHENTICATOR_VERSION}_${TARGETOS}_${TARGETARCH} -O /usr/local/bin/aws-iam-authenticator \
  && wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl -O /usr/local/bin/kubectl \
  && wget -q https://github.com/vmware-tanzu/velero/releases/download/v${VELERO_VERSION}/velero-v${VELERO_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz -O - | tar -xzvO velero-v${VELERO_VERSION}-${TARGETOS}-${TARGETARCH}/velero > /usr/local/bin/velero \
  && chmod +x /usr/local/bin/aws-iam-authenticator /usr/local/bin/velero /usr/local/bin/kubectl \
  && mkdir /workspace \
  && chmod g+rwx /workspace /root

WORKDIR /workspace

CMD sh