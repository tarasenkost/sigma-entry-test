kubectl apply -f ./ns-and-sa.yaml
kubectl apply -f ./rbac.yaml
kubectl apply -f ./nginx-config.yaml
kubectl apply -f ./loadbalancer.yaml
kubectl apply -f ./nginx-deployment.yaml
kubectl apply -f ./jobs.yaml
kubectl apply -f ./ingress-class.yaml
kubectl apply -f ./webhooks.yaml