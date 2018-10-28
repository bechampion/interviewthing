all: init apply
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
bye:
	terraform destroy
