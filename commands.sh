## This is not a script
## It is a reference

## Start kubelet
kubelet --pod-manifest-path ./manifests/

## Inspect IP address
docker inspect <id> | jq '.[0].NetworkSettings'
docker inspect <id> | jq '.[0].HostConfig | { NetworkMode: .NetworkMode}'


## Interact via Kubectl
kubectl version
kubectl api-resources

