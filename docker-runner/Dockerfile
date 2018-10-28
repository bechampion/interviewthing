FROM mesosphere/aws-cli
RUN apk add --update ca-certificates bash make curl python py-pip jq
RUN pip install httpstat
COPY kubectl /bin/kubectl
COPY helm /bin/helm
COPY terraform /bin/terraform
COPY aws-iam-authenticator /bin/aws-iam-authenticator
RUN mkdir /doall
#ENTRYPOINT ["/usr/bin/make -C /doall"]
ENTRYPOINT []
