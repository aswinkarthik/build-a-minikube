# Build a Minikube

> From scratch

This repository contains resources to create a minikube from scratch.

## Feature targeted

Ability to create a deployment which should result in pods running.

## Pre-requisites

1. Vagrant
2. Virtualbox

## Steps

**1. Setup VM**

```bash
vagrant up
```

This creates a VM in Virtualbox with necessary tools installed (kubelet & kubectl). Checkout the shell provisioner for more information.

**2. Run Kubelet**

```bash
$ vagrant ssh

$ sudo su -

$ mkdir manifests

## Run Kubelet pointing to manifests
$ kubelet --pod-manifest-path ./manifests
```

**3. Run Kubernetes Master components**

Copy the following files into the manifests directory

```bash
## /src should be mounted already by now in your VM

## API Server
$ cp /src/02-*.yml ./manifests

## ETCD
$ cp /src/03-*.yml ./manifests

## Controller Manager
$ cp /src/05-*.yml ./manifests

## Scheduler
cp /src/06-*.yml ./manifests
```

**4. Restart Kubelet poining to KubeAPI server**

```bash
$ kubelet --pod-manifest-path ./manifests --kubeconfig /src/kubeconfig.yml
```

**5. Create Kubernetes Deployment resource**

```bash
## This should return server version
$ kubectl version

$ kubectl apply -f /src/04-nginx-deployment.yml
```

