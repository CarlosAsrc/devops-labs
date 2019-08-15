# Telemetry / Observability 
This project use Collectd and ELK stack to apply Obervability in a go microservice, and have 4 main modules:
### 1. Calculator
A go microservice provisioned by docker, that have Collectd configured to send metrics and logs to Logstash.
### 2. Logstash
A configuration to Logstash, that will get input logs from Collectd, process the logs and send the output to ElasticSearch.
### 3. Elasticsearch
Elasticsearch will get the data from Logstash output and store it in way to provide an efficient search for collected metrics.
### 4. Kibana
Kibana have tools to analyze and display the metrics in a web interface.
## RUNNING
- To run the go microservice and ELK stack to collect, analyse and display metrics and logs from Collectd, execute: `docker-compose up`
- Acces Kibana available in http://localhost:5601
- The configured index named "collectd-calculator" can be found in
http://localhost:5601/app/kibana#/management/elasticsearch/index_management/indices?_g=()
- To vizualize the metrics, its necessary to create an index pattern based on our collectd index:
http://localhost:5601/app/kibana#/management/kibana/index_patterns?_g=()
- Now its possible create vizualizations to our metrics collected from collectd:
http://localhost:5601/app/kibana#/management/kibana/index_pattern?_g=()


## Calculator Microservice
The endpointns of microservice:

### SUM
    http://localhost:8080/calc/sum/{a}/{b}
### SUB
    http://localhost:8080/calc/sub/{a}/{b}
### MUL
    http://localhost:8080/calc/mul/{a}/{b}
### DIV
    http://localhost:8080/calc/div/{a}/{b}
### History
    http://localhost:8080/calc/history
