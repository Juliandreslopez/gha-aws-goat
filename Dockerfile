# Pull the minimal Ubuntu image
FROM us-central1-docker.pkg.dev/panw-utd-public-cloud/utd-demo-images/utd-cnsp/ubuntu:malware

# AWS Keys for Secrets Detection
ENV AWS_ACCESS_KEY_ID="AKIA4NACSIJMDDNSEDTE"
ENV AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

# Nginx already present in base image. Just copy the Nginx config
COPY default /etc/nginx/sites-available/default

# Install a vulnerable package
RUN apt update -y
RUN apt install python3-pip git curl wget node-hawk node-minimist -y

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD /opt/entrypoint.sh && /usr/sbin/nginx -g daemon off
