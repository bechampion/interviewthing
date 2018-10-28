create:
	docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra create
destroy:
	docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra destroy

