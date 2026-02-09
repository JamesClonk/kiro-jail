#!/bin/bash

source ~/.aws_identity_provider || true
export KIRO_JAIL=$(basename $(pwd))

podman run -it --rm \
	-v ~/.kiro:/home/kiro/.kiro \
	-v "$(pwd)":/home/kiro/project \
	-w /home/kiro/project \
	--name "${KIRO_JAIL}" \
	kiro-jail:latest /bin/bash -c "kiro-cli login --identity-provider ${AWS_IDENTITY_PROVIDER_URL} --region ${AWS_REGION} --use-device-flow; kiro-cli"
