#!/bin/bash

export KIRO_JAIL=$(basename $(pwd))

docker run -it --rm \
	-v ~/.kiro:/root/.kiro \
	-v "$(pwd)":/root/project \
	-w /root/project \
	--name "${KIRO_JAIL}" \
	kiro-cli
