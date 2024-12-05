In the first folder kubernetes is the solution as is requested in the assignment:
    -Created 2 new namespaces production and staging
    -2 new roles developer and admin with the permission specified
    -in the secrets folder are located the secrets credentials for secure connection to rds
(Tested on minikube cluster set-up locally and it works.)

In the Terraform folder I tried to add my approach to it by doing it using terraform and is a bit different (This solution is not test as I didn't have the proper infrastructure, if is tested is possible to not work because minor changes needs to be done, and some values needs to be updated)
In this solution the namespaces and the roles are created with the cluster.
The secrets for RDS are stored in AWS Secrets Manager and dynamically pulled to kubernetes, in this way if the secrets change in secrets manager will change to kubewrnetes too, also in kubernetes secrets are stored aws credentials to access the secret manager.
