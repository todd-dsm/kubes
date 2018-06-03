#!/usr/bin/env make
# vim: tabstop=8 noexpandtab
#SHELL += -xue

tf-init:
	if [ ! -d '.terraform' ]; then \
		printf '\n%s\n' 'Initializing the build...'; \
		terraform init -get=true; \
	else \
		printf '\n%s\n\n' '  Dude, already initialized!'; \
	fi


tf-plan:
	terraform plan \
		-out=/tmp/kubes.plan 

tf-build:
	terraform apply "/tmp/kubes.plan" --auto-approve \
		-no-color \
		-var-file="build.tfvars" 2>&1 | tee /tmp/kubes.out
	./scripts/upload-secrets.sh 
