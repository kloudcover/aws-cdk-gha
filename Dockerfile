FROM node:18-alpine
LABEL org.opencontainers.image.source = "https://github.com/kloudcover/aws-cdk-gha"
# Install AWS CDK CLI and other dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    jq \
    curl \
    yq \
    && npm install -g aws-cdk \
    && rm -rf /var/cache/apk/* \
    && npm install -g aws-cdk@latest \
    && python3 -m venv /opt/venv

# Set working directory  
WORKDIR /github/workspace

# Add python to path
ENV PATH="/opt/venv/bin:$PATH"

COPY infra/requirements.txt /opt/venv/
RUN pip install -r /opt/venv/requirements.txt
ENTRYPOINT [ "cdk" ]
