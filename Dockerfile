FROM openjdk:8-jdk

WORKDIR /usr/local

# Add the knox user
RUN useradd -m knox

# Download and unpack the Knox release
RUN wget http://mirror.reverse.net/pub/apache/knox/1.1.0/knox-1.1.0.zip
RUN unzip knox-1.1.0.zip
RUN chown -R knox knox-1.1.0

# Create a startup script for the container command
RUN echo -e '#!/bin/bash\n#\n\nrunuser -l knox -c "/usr/local/knox-1.1.0/bin/knoxcli.sh create-master --master knox"\nrunuser -l knox -c "/usr/local/knox-1.1.0/bin/ldap.sh start"\nrunuser -l knox -c "/usr/local/knox-1.1.0/bin/gateway.sh start"\nrunuser -l knox -c "/usr/local/knox-1.1.0/bin/knoxcli.sh create-alias sandbox.discovery.pwd --value maria_dev"\ntail -f /usr/local/knox-1.1.0/logs/gateway.log' > /usr/local/start-knox.sh

RUN chmod +x /usr/local/start-knox.sh

EXPOSE 8443

CMD ["/bin/bash", "/usr/local/start-knox.sh"]
