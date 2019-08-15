FROM ubuntu:18.04
ARG vault_version=1.2.0
WORKDIR /home/
RUN apt update && apt install unzip wget -y
RUN wget https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip
RUN unzip vault_${vault_version}_linux_amd64.zip
RUN mv vault /usr/local/bin/
RUN vault -autocomplete-install
COPY ./config/vault_config.hcl /home/
ENTRYPOINT ["vault", "server", "-dev", "-config", "/home/vault_config.hcl"]