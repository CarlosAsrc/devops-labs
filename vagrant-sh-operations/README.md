# Golang application provivioned by Vagrantfile and shell.

## RUNNING
- To launch the VM, run `vagrant up`.

- To get into the VM, run `vagrant ssh`.

- Operations:
    - To run the go microservice, run `./microservice start`.
    - To stop the go microservice, run `./microservice stop`.
    - To get status of go microservice, run `./microservice status`.

- To use calculator microservice, go to http://55.55.55.5:8080

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
