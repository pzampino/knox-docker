# Apache Knox 1.1.0 Docker Container

Create and start the Knox container (and the demo LDAP server)

    docker-compose up --build

This creates a container named __knox-1.1.0__, and it also creates a bridge network named __knox-docker_knox-test___

If running the HDP Docker container, and you want this Knox instance to be able to interact with it, it must be connected to this network.

    docker network connect knox-docker_knox-test sandbox-hdp

The Knox Admin UI will be accessible at https://localhost:8443/gateway/manager/admin-ui/



