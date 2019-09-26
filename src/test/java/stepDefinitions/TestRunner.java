package stepDefinitions;

import org.junit.runner.JUnitCore;
import org.junit.runner.RunWith;
import org.testng.annotations.*;
import org.openqa.selenium.WebDriver;

import cucumber.api.CucumberOptions;
import cucumber.api.java.After;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin ={"pretty","html:target/cucumber-html-report/","json:target/cucumber.json"},
        features = {"src/test/java/featureFiles"},
        glue = {"Solvup/stepDefinitions/"},
        tags ={"@test1"}
                )
@Test
public class TestRunner {
	
}
