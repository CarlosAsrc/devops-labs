# Packaer config file for backing a Docker image of Go microservice.

## RUNNING
- To build the Docker image using the Packer configuration, run `packer build template.json`
- You can verify the created image "carlosasrc/golang" with `docker images`
- To run the container, use `docker run -it -p 8080:8080 carlosasrc/golang:0.1`
- The microservice will be available in http://localhost:8080/

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
