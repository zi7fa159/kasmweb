FROM debian:latest
RUN apt update -y && apt upgrade -y
RUN apt install curl net-tools sudo wget -y
#RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.12.0.d4fd8a.tar.gz
#RUN tar -xf kasm_release_1.12.0.d4fd8a.tar.gz
#ENTRYPOINT ["/kasm_release/install.sh"]
RUN mkdir app &&cd /app
WORKDIR /app
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.12.0.d4fd8a.tar.gz
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_service_images_amd64_1.12.0.d4fd8a.tar.gz
RUN curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_workspace_images_amd64_1.12.0.d4fd8a.tar.gz
RUN tar -xf kasm_release_1.12.0.d4fd8a.tar.gz
RUN sudo bash kasm_release/install.sh --offline-workspaces /app/kasm_release_workspace_images_amd64_1.12.0.d4fd8a.tar.gz --offline-service /app/kasm_release_service_images_amd64_1.12.0.d4fd8a.tar.gz
EXPOSE 443
