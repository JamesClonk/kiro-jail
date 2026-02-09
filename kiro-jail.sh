#!/bin/bash

source ~/.aws_identity_provider || true
export KIRO_JAIL=$(basename $(pwd))
export UID=$(id -u)
export GID=$(id -g)

podman run -it --rm \
	-v ~/.kiro:/home/kiro/.kiro:rw,Z \
	-v "$(pwd)":/home/kiro/project:rw,Z \
	-w /home/kiro/project \
	-u ${UID}:${GID} --userns keep-id \
	--name "${KIRO_JAIL}" \
	kiro-jail:latest /bin/bash -c "kiro-cli login --identity-provider ${AWS_IDENTITY_PROVIDER_URL} --region ${AWS_REGION} --use-device-flow; kiro-cli"
