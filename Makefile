create:
	docker run -e KUBECONFIG="/root/interview" -v ~/.aws/:/root/.aws/ -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra create
destroy:
	docker run -e KUBECONFIG="/root/interview" -v ~/.aws/:/root/.aws/ -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra destroy

