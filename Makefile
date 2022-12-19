default: docker_build

include .env

# Note: 
#	kubectl releases: https://github.com/kubernetes/kubernetes/releases
# velero releases: https://github.com/vmware-tanzu/velero/releases
VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))
DOCKER_IMAGE ?= pcloud/velero-kubectl
DOCKER_TAG ?= `git rev-parse --abbrev-ref HEAD`

docker_build:
	@docker buildx build \
		--build-arg KUBE_VERSION=$(KUBE_VERSION) \
		--build-arg HELM_VERSION=$(HELM_VERSION) \
		-t $(DOCKER_IMAGE):$(DOCKER_TAG) .

docker_push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)