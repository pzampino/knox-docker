# Apache Knox Release Docker Container

By default, this Dockerfile creates an image for Apache Knox 1.1.0

The release version can be overridden by modifying the following arguments in the __docker-compose__ file:
  * __RELEASE_VER__ (e.g., 1.0.0)
  * __RELEASE_MIRROR__ (The default mirror may not need to be overridden)

Run *docker compose* to create and start the Knox container based on this image (and the demo LDAP server)

    docker-compose up --build

This creates a container named __knox__, and it also creates a bridge network named __knox-docker_knox-test__

The Knox Admin UI will be accessible at https://localhost:8443/gateway/manager/admin-ui/


If running the HDP Docker container, and you want this Knox instance to be able to interact with it, it must be connected to this network.

    docker network connect knox-docker_knox-test sandbox-hdp




