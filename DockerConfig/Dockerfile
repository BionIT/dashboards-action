FROM alpine:3.13
# aws cli verison
ARG AWSCLI_VERSION="1.23.13"
# helm version
ARG HELM_VERSION="3.8.0"
# kubectl version
ARG KUBECTL_VERSION="1.23.6"
RUN apk add py-pip curl wget ca-certificates git bash jq gcc alpine-sdk
RUN pip install "awscli==${AWSCLI_VERSION}"
RUN curl -L -o /usr/bin/kubectl https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl
RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator
RUN wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm
# copy Opensearch and Opensearch Dashboard helm file
COPY configuration/os.yaml /usr/os.yaml
COPY configuration/osd.yaml /usr/osd.yaml
RUN chmod +x /usr/os.yaml
RUN chmod +x /usr/osd.yaml
# entry
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]: