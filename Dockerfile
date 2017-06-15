FROM alpine:3.3

ENTRYPOINT ["/tricorder-jobs/tric_job_healthcheck/podStatus.sh"]

ENV KUBE_LATEST_VERSION="v1.5.4"

 RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /bin/kubectl \
 && chmod +x /bin/kubectl \
 && apk add --update git \
 && git clone https://bitbucket-eng-sjc1.cisco.com/bitbucket/scm/tric/tricorder-jobs.git \
 && chmod 777 /tricorder-jobs/tric_job_healthcheck/podStatus.sh \
 && apk del --purge deps \
 && rm /var/cache/apk/* 
