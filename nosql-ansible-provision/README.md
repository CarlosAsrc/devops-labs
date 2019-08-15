# NoSQL provisioned by Ansible
Ansible roles to provide NoSQL tools.
## ROLES
The following roles can be found in `./roles` directory:
- base
    - Update and upgrade current OS.
- open-jdk-8
    - Install OpenJDK 8, required to get working with Kafka and Cassandra.
- redis
    - Install Redis.
    - Start Redis service.
- es
    - Install apt-transport-https and Elasticsearch.
    - Start Elasticsearch service.  
- cass
    - Install apt-transport-https and Cassandra Workbench.
    - Start Cassandra service.
- kafka
    - Install Zookeeper
    - Install unzip
    - Dowload Kafka
    - Extract Kafka to /opt/kafka/
    - Start Kafka service
## RUNNING
 - To run the ROLES configured in playbook.yml inside the VM, just start Vagrant VM: `vagrant up`
