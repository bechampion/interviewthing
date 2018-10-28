all: init apply kubeconfig configmap
init:
	terraform init
apply:
	terraform apply
configmap:
	#this should be replaced with a <() expansion .. later.
	terraform output config_map_aws_auth > /tmp/cmap && kubectl apply -f /tmp/cmap
kubeconfig:
	#maybe not straight up to config, do it somewhere else and eval() a different KUBECONFIG
	terraform output kubeconfig > ~/.kube/config
helm:
	kubectl apply -f kobjects/satiller.yaml
	helm init --service-account tiller
	until [ $$(kubectl get pod -n kube-system -l app=helm | grep Running | wc -l) -eq 1 ] ; do echo [DEBUG] Waiting for tiller.. ; done
	helm update
	helm install stable/nginx-ingress --name ingress
	helm install pychart/ --pyapp
	#until [ $$(curl -s -I $$(kubectl get svc -l app=nginx-ingress -o json | jq -r '.items[] | select( .spec.type == "LoadBalancer") | .status.loadBalancer.ingress[].hostname') | grep HTTP | grep 200) -eq 1 ] ; do echo 1 ; done
http:
	curl	
bye:
	terraform destroy

docker:
	docker run -v ~/.aws/:/root/.aws/ -v ~/.kube/config:/root/.kube/config -v $$(pwd):/doall -it interview/docker-runner make -C /doall
