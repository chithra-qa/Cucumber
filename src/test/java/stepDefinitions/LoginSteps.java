package stepDefinitions;

import org.openqa.selenium.WebDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import pageObjects.LoginPage;
import pageObjects.LoginPageObjects;

public class LoginSteps extends AbstractStepDefinition {
	WebDriver driver = getDriver();

	LoginPageObjects loginpage = new LoginPageObjects(driver);
	@Given("^I am at the solvup login page$")

    public void navigateToSolvup() throws Throwable {

                    driver.navigate().to("http://apps.solvup.com/login");

                    driver.manage().window().maximize();

    }
    
	@When("I login as {string}")
	public void Login(String string) {
//	    LoginPage.userLogin(driver).sendKeys(string);
//	    LoginPage.userPassword(driver).sendKeys("pass");
//	    LoginPage.loginBtn(driver).click();
	    
	    loginpage.enterUsername(string);
	    loginpage.enterPassword("pass");
	    loginpage.clickSubmit();
	}
	
}
