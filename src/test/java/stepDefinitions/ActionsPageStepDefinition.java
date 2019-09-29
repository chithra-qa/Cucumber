package stepDefinitions;

 

import static org.junit.Assert.*;

 

import java.util.List;

 

import org.openqa.selenium.By;

import org.openqa.selenium.WebDriver;

 

import io.cucumber.java.After;

import io.cucumber.java.en.And;

import io.cucumber.java.en.Given;

import io.cucumber.java.en.Then;

import io.cucumber.java.en.When;

import pageObjects.ActionsPage;

import pageObjects.ActionsPageObjects;

 

public class ActionsPageStepDefinition extends AbstractStepDefinition {

                WebDriver driver = getDriver();

 

                ActionsPageObjects actionsPageObj = new ActionsPageObjects(driver);

                @Given("^I am at the example cypress site$")

 

    public void navigateToCypress() throws Throwable {

 

                    driver.navigate().to("http://example.cypress.io");

                    driver.manage().window().maximize();

 

    }

               

 

    @And("email field should have value {string}")

    public void checkEmailValue(String email) {

                actionsPageObj.checkEmail(email);

    }

   

    @When("I navigate to actions")

    public void goToActions() {

                ActionsPage.actions(driver).click();

    }

 

    @Then("the textarea should be disabled")

    public void checkTextareaIsDisabled() {

                boolean textarea = ActionsPage.textarea(driver).isEnabled();

                assertFalse(textarea);

 

    }

   

                @Then ("I should be able to perform the following functions:")

    public void performFunction(List<String> action) throws Throwable {

                                for (int i=0; i<action.size(); i++){

                                if(action.get(i).equalsIgnoreCase("click"))

                                {

                                                actionsPageObj.performClick();

                                                boolean popoverDisplayed =ActionsPage.clickPopover(driver).isDisplayed();      

                                                assertTrue(popoverDisplayed);

                                }

                                if(action.get(i).equalsIgnoreCase("type"))

                                {

                                                actionsPageObj.performType("chithravr@gmail.com");

                                                boolean textEmpty = ActionsPage.textClear(driver).getAttribute("value").equals("");

                                                assertTrue(textEmpty);

                                }

                                if(action.get(i).equalsIgnoreCase("submit"))

                                {

                                                actionsPageObj.performSubmit();

                                                boolean couponSubmitted =ActionsPage.couponSubmitted(driver).isDisplayed();            

                                                assertTrue(couponSubmitted);

                                }

                                if(action.get(i).equalsIgnoreCase("check"))

                                {

                                                actionsPageObj.performCheck();

                                                boolean checkboxChecked =ActionsPage.checkbox(driver).isSelected();

                                                assertTrue(checkboxChecked);

                                }

                                if(action.get(i).equalsIgnoreCase("select"))

                                {

                                                actionsPageObj.performSelect();

                                }

                                if(action.get(i).equalsIgnoreCase("clear"))

                                {

                                                actionsPageObj.performClear();

                                                ActionsPage.textClear(driver).clear();

                                                boolean textEmpty = ActionsPage.textClear(driver).getAttribute("value").equals("");

                                                assertTrue(textEmpty);

                                }

                                }

                }

               

 

 

    @After

                public void tearDown() throws InterruptedException{

                Thread.sleep(3000);

                                driver.close();

                }

 

   

}
