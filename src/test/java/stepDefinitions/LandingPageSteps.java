package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pageObjects.LandingPage;
import pageObjects.LandingPageObjects;

public class LandingPageSteps extends AbstractStepDefinition {
	WebDriver driver = getDriver();

	LandingPageObjects loginpage = new LandingPageObjects(driver);
	@Given("^I am at the example cypress site$")

    public void navigateToSolvup() throws Throwable {

                    driver.navigate().to("http://example.cypress.io");
                    driver.manage().window().maximize();

    }
    
	@When ("I click the action \\\"([^\\\"]*)\\\"$\"")
    public void clickAction(String action) throws Throwable {
        driver.findElement(By.xpath("//a[contains(text(),'type')]")).click();
    }

    @When("I enter the email {string}")
    public void i_enter_the_email(String string) {
    }

    @Then("the textarea should be disabled")
    public void the_textarea_should_be_disabled() {
    }

}
