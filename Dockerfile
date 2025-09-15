FROM jenkins/jenkins:jdk21

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io curl && \
    apt-get clean

# Install Docker Compose (v2.x)
RUN curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 \
    -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Add Jenkins user to Docker group
RUN groupadd docker || true && \
    usermod -aG docker jenkins

USER jenkins