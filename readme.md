In the first folder kubernetes is the solution as is requested in the assignment:
    -Created 2 new namespaces production and staging
    -2 new roles developer and admin with the permission specified
    -in the secrets folder are located the secrets credentials for secure connection to rds
(Tested on minikube cluster set-up locally and it works.)

In the Terraform folder I tried to add my approach to it by doing it using terraform (This solution is not test as I didn't have the proper infrastructure, if is tested is possible to not work because minor changes needs to be done.)
In this solution the namespaces and the roles are created with the cluster.
I also created a pipeline(same as the above i didn't have the proper infra to test, it might not work), this can be modified in various ways to automate the process of creating new namespaces and roles, to new clusters also to existing ones.