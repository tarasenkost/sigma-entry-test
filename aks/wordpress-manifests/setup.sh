kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f ./mariadb-secrets.yaml
kubectl apply -f ./mariadb-service.yaml
kubectl apply -f ./mariadb-statefullset.yaml

kubectl apply -f ./wordpress-claim.yaml
kubectl apply -f ./wordpress-configmap.yaml
kubectl apply -f ./wordpress-secrets.yaml
kubectl apply -f ./wordpress-service.yaml
kubectl apply -f ./wordpress-ingress.yaml
kubectl apply -f ./wordpress-deployment.yaml
