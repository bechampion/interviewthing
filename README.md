# my test for the interview

TLDR:
I think i tried to fit as much as i could wihtout using existing tf modules etc.
The TF code is extremely lean just used a little ammount of interpolations
The same with the Makefiles extremely simple to read , i didn't feel the need of complexity
The Docker image bechampion/runnner contains all the tools that you need to run this
This sets up:
- EKS Cluster
- VPC 3 subnet(nat gw) 3 subnet(internet gw)
- Iam roles needed by EKS worker nodes
- Secgroups needed for communication between ELB and worker nodes
- Tagging 
- helm / tiller
- helm nginx-ingress
- helm little python app `python -m SimpleHTTPServer` but it works as a POC
- And it all hopefullt runs from a docker image `bechampion/runner`


todo: 
- intial S3 bucket AES serverside needs to be provisioned.. 
- AMI hardcoded
- ssh key non existent
- docker launcher DONE
- ingress DONE
- template for app DONE
- curls. DONE
- automate ami GPU subscription....??? -- ignore
- default sg is rejecting 10/8  DONE
- terraform output json to absorve kubeconfig and configmap that need to jq'd into something DONE
- SG and SGRules created by Services dynamically dont' seem to be removed when we do helm delete of a given chart... seems to be a bug that it's fixed with a tag.


idea:
- Run everything from a container image (i need to push) that contains jq,helm,aws-iam-authenticator,kubectl,terraform
- VPCs and EKS etc is created by terraform
- stuff withing kube is driven by helm
- istio maybe if i got time ? -- time issues
- zipkin would be good if istio time is true -- time issues


*instructions:*
- have docker installed
- this runs on root accounts no sts or anything similar
- create s3 bucket on ireland called "interviewthing-cluster" or change on state.tf (looking to automate this)
- hopefully `git clone https://github.com/bechampion/interviewthing.git && cd interviewthing && make create` would run creation of vpc eks helm ingress pychart and some curls to test that everything is working.
- To destroy `make destroy` bare in mind some resources don't seem to be cleaned after helm destroy so some SG have to be deleted by hand... until they have the right tags.
- sorry for the `| true` it was a matter of time
