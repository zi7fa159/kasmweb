FROM debian:latest
USER root
RUN apt update -y && apt upgrade -y
RUN apt install curl sudo -y
RUN cd /tmp 
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.12.0.d4fd8a.tar.gz
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_service_images_amd64_1.12.0.d4fd8a.tar.gz
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_workspace_images_amd64_1.12.0.d4fd8a.tar.gz
RUN tar -xf kasm_release_1.12.0.d4fd8a.tar.gz
RUN sudo bash kasm_release/install.sh --offline-workspaces /kasm_release_workspace_images_amd64_1.12.0.d4fd8a.tar.gz --offline-service /kasm_release_service_images_amd64_1.12.0.d4fd8a.tar.gz
EXPOSE 443
EXPOSE 80
