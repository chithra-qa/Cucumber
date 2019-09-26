$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("file:src/test/java/featureFiles/Login.feature");
formatter.feature({
  "name": "Login to Solvup",
  "description": "",
  "keyword": "Feature",
  "tags": [
    {
      "name": "@tag"
    }
  ]
});
formatter.scenario({
  "name": "lodge an abuse case for a regular product in doa period and",
  "description": "    check for a repair outcome with vendor liability",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@tag"
    },
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "I am at the solvup login page",
  "keyword": "Given "
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
formatter.step({
  "name": "I login as \"JB0002\"",
  "keyword": "When "
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
});