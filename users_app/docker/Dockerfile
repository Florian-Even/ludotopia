FROM ruby:3.1.2

# Install basic packages
RUN set -e; \
    apt update; \
    apt install -y \
      curl \
      less

RUN set -e; \
    gem update --system 7.0.2

# Set current user to a non root user
ARG DEVELOPER_UID=1000
ARG DEVELOPER_GID=1000
RUN set -e; \
    applicationDirectories=' \
    /app \
    /usr/local/bundle \
    '; \
    groupadd --gid $DEVELOPER_GID developer; \
    useradd \
      --create-home \
      --shell /bin/bash \
      --no-user-group \
      --uid $DEVELOPER_UID \
      --gid $DEVELOPER_GID \
      developer; \
    mkdir -p $applicationDirectories; \
    chown -R developer:developer $applicationDirectories
USER developer

WORKDIR /app

CMD ["bash"]
