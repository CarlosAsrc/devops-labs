# Stress Test / Chaos
A stress test scenario to calculator microservice.
To run the Scala stress test script, the sbt tool was used.
The stress test script can be found in `./src/test/scala/calculatorHistorySimulation.scala`.
## RUNNING
- The stress test can be executed with the command `sbt gatling:test`.
- The result of stress test can be found in `./target/gatling/calculatorhistorysimulation-{timestamp}/index.html`.
- You can also run the stress test script in Jenkins, using the `Jenkinsfile` as a pipeline script.
