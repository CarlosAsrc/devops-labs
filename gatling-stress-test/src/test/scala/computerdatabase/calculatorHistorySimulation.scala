package computerdatabase

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class calculatorHistorySimulation extends Simulation {

  val httpProtocol = http
    .baseUrl("http://localhost:8090")
    .acceptHeader("application/json,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
    .acceptEncodingHeader("gzip, deflate")
    .acceptLanguageHeader("en-US,en;q=0.5")
    .userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:16.0) Gecko/20100101 Firefox/16.0")

  val scn = scenario("Scenario Name")
    .exec(http("history")
      .get("/calc/history"))

  setUp(
      scn
      .inject(
        constantUsersPerSec(300)
        .during(60 seconds)
      )
      .protocols(httpProtocol)
    )
}
