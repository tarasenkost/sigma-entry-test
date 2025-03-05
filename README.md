WP deployment: https://sigma.starasenko.pp.ua/

### Deploy WordPress app on Kubernetes with the following requirements:
- Deploy AKS cluster in Azure manually;
- Be able to scale up and scale down cluster via portal;
- Deploy wordpress with own manifests (not Helm);
- Be able to read own code and answer on advanced technical questions (ingress, pv, pvc);
- Show how to connect to Node VM, how to connect to AKS, how to connect to pod from command line/portal;
- Show wordpress in browser;
- Implement RBAC for the cluster to restrict permissions;
- Modify the default WordPress setup with custom themes.

### Додаткове завдання зі зірочкою *

> 1) Deploy the following modules with Terraform:

Common requirements:

- module should be deployed only if condition is true (e.g. install_base = true)
- module should be written on your own
- Please review module and add all necessary vars (based on your experience) as user input (e.g. kv sku, etc.)
- Be able to read own code and answer on advanced technical questions

Basic module includes:
- resource group, vnet, security group, kv
- Need to create single security group with using dynamic block. User need to pass ips and ports via single terraform variable
- Need to configure possibility to deploy several key vaults based on user input. 
 
>  2) Deploy ingress nginx to AKS with own manifests (not Helm);

### Додаткове завдання зі зірочкою **
> 3) Pack ingress nginx object (not controller) + wordpress application into common Helm chart. Deploy it into cluster
