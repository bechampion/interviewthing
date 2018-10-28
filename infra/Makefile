create: init apply kubeconfig configmap helm test
destroy: init bye

init:
	terraform init
apply:
	terraform apply
configmap:
	#this should be replaced with a <() expansion .. later.
	terraform output config_map_aws_auth > /tmp/cmap && kubectl apply -f /tmp/cmap
kubeconfig:
	#maybe not straight up to config, do it somewhere else and eval() a different KUBECONFIG
	mkdir ~/.kube/
	terraform output kubeconfig > ~/.kube/config
helm:
	kubectl apply -f kobjects/satiller.yaml
	helm init --service-account tiller
	###I need something more clever here..
	until [ $$(kubectl get pod -n kube-system -l app=helm | grep '1/1' | wc -l) -eq 1 ] ; do echo [DEBUG] Waiting for tiller.. ;sleep 1; done
	sleep 10
	helm repo update
	helm install stable/nginx-ingress --name ingress --set controller.service.annotations."service\\.beta\\.kubernetes\\.io/aws-load-balancer-external"="0.0.0.0/0" --set controller.service.annotations."service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"="true" --wait | true
	helm install pychart/ --name pyapp --wait | true
test:
	until [ $$( dig +short $$(kubectl get svc -l app=nginx-ingress -o json | jq -r '.items[] | select( .spec.type == "LoadBalancer") | .status.loadBalancer.ingress[].hostname') | wc -l) -gt 0  ] ; do echo "[DEBUG] waiting for resolution of the ELB name" ; sleep 1 ; done
	for i in $$(seq 1 5) ; do curl $$(kubectl get svc -l app=nginx-ingress -o json | jq -r '.items[] | select( .spec.type == "LoadBalancer") | .status.loadBalancer.ingress[].hostname') -HHost:python.interview.local ; done
	for i in $$(seq 1 5) ; do httpstat $$(kubectl get svc -l app=nginx-ingress -o json | jq -r '.items[] | select( .spec.type == "LoadBalancer") | .status.loadBalancer.ingress[].hostname') -HHost:python.interview.local -I ; done
bye:
	helm delete --purge pyapp | true
	helm delete --purge ingress | true
	terraform destroy

