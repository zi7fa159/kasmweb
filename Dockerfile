FROM debian:latest
RUN apt update -y && apt upgrade -y
RUN apt install curl net-tools sudo wget -y
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.12.0.d4fd8a.tar.gz
RUN tar -xf kasm_release_1.12.0.d4fd8a.tar.gz
RUN cd /kasm_release
ENTRYPOINT ["./install.sh"]
EXPOSE 443
