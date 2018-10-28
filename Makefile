all:
	docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd)/infra/:/infra -it interview/docker-runner make -C /infra all

