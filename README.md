![Oozou](https://cdn.oozou.com/assets/website/favicon-32x32-31e7864857aa3fc3b35d0c34bfea6b8e0cdeb22f8f6317701c0f7f0df564543f.png)


## Introduction

This is a technical test for the role of **DevOps Engineer**.

## Objectives

This test helps us to understand
- how do you approach infrastructure design
- how do you manage microservices communication
- how do you consider security implications

## Project Setup

Project root has [`index.js`](/index.js) file. It simulates a simple app that runs infinitely & sends metrics to a [`statsd`](https://github.com/statsd/statsd) server.

## Exercices

  1. Add a `Dockerfile` to containerize the app, with support for multiple environments (DEV, UAT & Production)
  2. Design the cloud infrastructure diagram (prefer AWS) with all the resources that are required for the application(Node app, `statsd` & the backend. Applicants can use any backends for `statsd` eg: `Graphite`). Use ECS or EKS as application platform.
  3. Utilize Terraform to establish infrastructure that adheres to industry-standard security and high availability (HA) practices.
  4. (Optional) Deploy on the cloud computing platforms

## Submitting Your Code

Email us your Github repo and grant he access to `lycbrian` We expect meaningful git commits, ideally one commit per exercise with commit messages clearly communicating the intent.

If you deploy it to any cloud platforms, please send us instructions & relevant IAM user credentials.

## Diagram

![Infra Diagram](https://drive.google.com/file/d/1diEgj2YbR0TbH4Ph4ofbaARq_gW2W_kc/view?usp=sharing)

## Requirements

in `provider.tf` requires:
- s3 bucket to keep tf state
- dynamodb to keep lock files

other requirements:
- AWS access and Secret key with administrator access
- terraform v.1.13
- helm v3.10.3
- helmfile v0.150.0

## How to recreate AWS resources

1. init terraform modules by using command
```
$ terraform init
```
2. plan to see which resources will be created
```
$ terraform plan
```
3. create AWS resources by using command
```
$ terraform apply
```

## How to deploy graphite

Deploy using helm3 with helmfile as below
```
$ cd helm-deployment
$ helmfile -e dev -l "name=graphyte" -i apply
```

## How to deploy application manually

required: 
- application image built and pushed in ECR
```
$ kubectl apply -f service-deployment/dev-deployment.yaml
```

## How to reach graphite dashboard

since svc and ingress is not fully prepared, please reach the dashboard via port-forward 
```
$ kubectl port-forward graphite-0 8080:8080
```