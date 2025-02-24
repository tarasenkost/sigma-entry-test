kubectl delete -f ./ns-and-sa.yaml
kubectl delete -f ./rbac.yaml
kubectl delete -f ./nginx-config.yaml
kubectl delete -f ./loadbalancer.yaml
kubectl delete -f ./nginx-deployment.yaml
kubectl delete -f ./jobs.yaml
kubectl delete -f ./ingress-class.yaml
kubectl delete -f ./webhooks.yaml