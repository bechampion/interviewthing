FROM alpine:latest
#RUN adduser -D -u 10000 aws-iam-authenticator
RUN apk add --update ca-certificates
RUN apk add --update bash
#FROM scratch
#COPY --from=0 /etc/passwd /etc/passwd
#COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#COPY --from=0 /bin/bash /bin/bash
COPY kubectl /bin/kubectl
COPY terraform /bin/terraform
COPY aws-iam-authenticator /bin/aws-iam-authenticator
#USER aws-iam-authenticator
#ENTRYPOINT ["/aws-iam-authenticator"]
