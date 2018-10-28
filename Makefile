create:
	docker run -e KUBECONFIG="~/interview" -v ~/.aws/:/root/.aws/ -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra create
	#docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra create
destroy:
	docker run -e KUBECONFIG="~/interview" -v ~/.aws/:/root/.aws/ -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra destroy
	#docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd)/infra/:/infra -it bechampion/runner make -C /infra destroy

