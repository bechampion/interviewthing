#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${cluster_endpoint}' --b64-cluster-ca '${certificate_authority_data}' '${cluster_name}'

