# interviewthing


todo: 
- intial S3 bucket AES serverside needs to be provisioned..
- AMI hardcoded
- ssh key non existent
- docker launcher
- ingress
- template for app
- curls.
- automate ami GPU subscription....??? -- ignore
- default sg is rejecting 10/8 
- terraform output json to absorve kubeconfig and configmap that need to jq'd into something


idea:
- Run everything from a docker file (i'll be pushing)
- Makefile probs calls docker runs .. ?
- pass the Makefile to container with -v ?
- istio maybe if i got time ?
- zipking would be good if istio time is true


instructions:
- have docker installed
- this runs on root accounts no sts or anything similar
- create s3 bucket on ireland called "interviewthing-cluster" or change on state.tf (looking to automate this)
- hopefully `make all` would run creation of vpc eks helm ingress pychart and some curls to test that everything is working.
