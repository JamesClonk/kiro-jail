#!/bin/bash

source ~/.aws_identity_provider || true
export AWS_IDENTITY_PROVIDER_URL=${AWS_IDENTITY_PROVIDER_URL:-https://your-value.awsapps.com/start}
export AWS_REGION=${AWS_REGION:-eu-central-1}
export KIRO_JAIL=$(basename $(pwd))
export KIRO_UID=$(id -u)
export KIRO_GID=$(id -g)

podman run -it --rm \
	-v ~/.kiro:/home/kiro/.kiro:rw,Z \
	-v "$(pwd)":/home/kiro/project:rw,Z \
	-w /home/kiro/project \
	-u ${KIRO_UID}:${KIRO_GID} --userns keep-id \
	--name "${KIRO_JAIL}" \
	kiro-jail:latest /bin/bash -c "kiro-cli login --identity-provider ${AWS_IDENTITY_PROVIDER_URL} --region ${AWS_REGION} --use-device-flow; kiro-cli"
