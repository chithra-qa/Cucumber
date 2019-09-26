package stepDefinitions;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import pageObjects.LoginPage;

public class LoginSteps extends AbstractStepDefinition {
	WebDriver driver = getDriver();

	@Given("^I am at the solvup login page$")

    public void navigateToSolvup() throws Throwable {

                    driver.navigate().to("http://apps.solvup.com/login");

                    driver.manage().window().maximize();

    }
    
	@When("I login as {string}")
	public void Login(String string) {
	    LoginPage.userLogin(driver).sendKeys(string);
	    LoginPage.userPassword(driver).sendKeys("pass");
	    LoginPage.loginBtn(driver).click();
	}
	
}
