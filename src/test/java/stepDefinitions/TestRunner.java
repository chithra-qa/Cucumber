package stepDefinitions;

 

import org.junit.runner.RunWith;

import org.testng.annotations.*;

 

import io.cucumber.junit.Cucumber;

import io.cucumber.junit.CucumberOptions;

 

@RunWith(Cucumber.class)

@CucumberOptions(

        plugin ={"pretty","html:target/cucumber-html-report/","json:target/cucumber.json"},

        features = {"src/test/java/featureFiles"},

        glue = {""},

        tags ={"@test"}

                )

@Test

public class TestRunner {

               

}