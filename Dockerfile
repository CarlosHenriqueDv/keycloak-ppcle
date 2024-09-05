FROM ppc64le/alpine:latest
#FROM alpine:latest

# Metadata
LABEL maintainer="cshenrique02@gmail.com"

# Variáveis de ambiente
ENV LANG=en_US.UTF-8 

# Instalar dependências
RUN apk update && apk add --no-cache curl tar bash 
RUN apk update && \
    apk add --no-cache \
    openjdk11 \
    openssl \
    tar \
    gzip \
    wget \
    which && \
    rm -rf /var/cache/apk/*


COPY jboss /opt/jboss
RUN chmod -R 777 /opt/jboss
# Expor as portas do Keycloak
EXPOSE 8080
EXPOSE 8443

# Entry point e comando
ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]

CMD ["-b", "0.0.0.0"]
