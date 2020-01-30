package stepDefinitions;

import org.testng.annotations.*;
import io.cucumber.junit.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.TestNGCucumberRunner;
import featureFiles.*;

@CucumberOptions(

        features = {"src/test/java/featureFiles"},
		plugin ={"pretty","html:target/cucumber-html-report/","json:target/cucumber.json"},
        glue = {"src/test/java/stepDefinitions"},
        tags ={"@test"}
)


@Listeners(listeners.TestNGListeners.class)
@Test (retryAnalyzer = listeners.RetryAnalyzer.class, alwaysRun = true)
public class TestRunnerTestNG extends AbstractTestNGCucumberTests{

               
}