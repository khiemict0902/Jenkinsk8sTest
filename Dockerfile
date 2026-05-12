FROM jenkins/inbound-agent:latest-jdk21 as jnlp 

FROM alpine:latest 

ENV HTTP_PROXY=http://10.26.2.55:8080 
ENV HTTPS_PROXY=http://10.26.2.55:8080 
ENV no_proxy=localhost,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,127.0.0.0/8 

RUN apk update && \ 
    apk add --no-cache openjdk21 bash git 

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent 
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar 

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
