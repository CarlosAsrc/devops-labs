# Golang application provisioned by Ansible

## RUNNING
 - To run the playbook.yml inside the VM, start Vagrant VM: `vagrant up`
 - The microservice will be available in: http://55.55.55.5:8080/
 - To manipulate de microservice, you can log in the VM with `vagrant ssh` and use the `microservice.sh`:
    - To run the go microservice, run `./microservice start`.
    - To stop the go microservice, run `./microservice stop`.


## Calculator Microservice
The endpointns of microservice:

### SUM
    http://55.55.55.5:8080/calc/sum/{a}/{b}
### SUB
    http://55.55.55.5:8080/calc/sub/{a}/{b}
### MUL
    http://55.55.55.5:8080/calc/mul/{a}/{b}
### DIV
    http://55.55.55.5:8080/calc/div/{a}/{b}
### History
    http://55.55.55.5:8080/calc/history
