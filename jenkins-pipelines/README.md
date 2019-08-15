# Jenkins Pipelines to bake Docker image with Packer and deploy the Go microservice.

## RUNNING
- Use the `BAKE/Jenkinsfile` on Jenkins tool to bake the docker image.
- You can verify the created image "carlosasrc/golang" with `docker images`
- Use the `LAUNCH/Jenkinsfile` on Jenkins tool to deploy the go microservice.
- The microservice will be available in http://localhost:8090/

## BAKE
- preparation: clone repository containning the go application and the packer template. Its necessary config a credentials named `git-credentials` to get acces to repository.
- bake: bake a docker image using the packer template.yml.

## LAUNCH
- launch: launch the docker container.

## Calculator Microservice
The endpointns of microservice:

### SUM
    http://localhost:8090/calc/sum/{a}/{b}
### SUB
    http://localhost:8090/calc/sub/{a}/{b}
### MUL
    http://localhost:8090/calc/mul/{a}/{b}
### DIV
    http://localhost:8090/calc/div/{a}/{b}
### History
    http://localhost:8090/calc/history
