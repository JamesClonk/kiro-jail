#!/bin/bash

export KIRO_JAIL=$(basename $(pwd))

podman run -it --rm \
	-v ~/.kiro:/home/kiro/.kiro \
	-v "$(pwd)":/home/kiro/project \
	-w /home/kiro/project \
	--name "${KIRO_JAIL}" \
	kiro-jail:latest kiro-cli
