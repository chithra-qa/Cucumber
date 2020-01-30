package stepDefinitions;

import org.junit.runner.RunWith;

import org.testng.annotations.*;

 

import io.cucumber.junit.Cucumber;

import io.cucumber.junit.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin ={"pretty","html:target/cucumber-html-report/","json:target/cucumber.json"},
        features = {"src/test/java"},
        glue = {""},
        tags ={"@test"}
                )
@Test (retryAnalyzer = listeners.RetryAnalyzer.class, alwaysRun = true)
public class TestRunner{
	   
}
