# Golang application in Docker container running with sh commands

## RUNNING
To run the microservice.sh, use the folowing pattern:

**./microservice.sh [start|stop|status] (name)**

Using:
- start: If a docker image named by ```name``` arg not yet exists, it will be builded. Then, a docker container will be started. Ex:
    - ```./microservice.sh start calculator```
- stop: Stop the microservice. Ex:
    - ```./microservice.sh stop calculator```
- status: To know if the microservice is RUNNING or NOT RUNNING. Ex:
    - ```./microservice.sh status calculator```

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
