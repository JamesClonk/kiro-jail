#!/bin/bash

export KIRO_JAIL=$(basename $(pwd))

podman run -it --rm \
	-v "$(pwd)":/home/project \
	-v ~/.kiro:/home/project/.kiro \
	-w /home/project \
	--name "${KIRO_JAIL}" \
	kiro-jail:latest kiro-cli
