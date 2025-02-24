kubectl delete -f ./mariadb-secrets.yaml
kubectl delete -f ./mariadb-service.yaml
kubectl delete -f ./mariadb-statefullset.yaml

kubectl delete -f ./wordpress-claim.yaml
kubectl delete -f ./wordpress-configmap.yaml
kubectl delete -f ./wordpress-secrets.yaml
kubectl delete -f ./wordpress-service.yaml
kubectl delete -f ./wordpress-ingress.yaml
kubectl delete -f ./wordpress-deployment.yaml