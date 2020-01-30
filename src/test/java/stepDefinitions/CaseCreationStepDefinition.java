package stepDefinitions;

 

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.List;
import utils.*;

import org.openqa.selenium.By;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import io.cucumber.core.api.Scenario;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.After;
import io.cucumber.java.Before;

import io.cucumber.java.en.And;

import io.cucumber.java.en.Given;

import io.cucumber.java.en.Then;

import io.cucumber.java.en.When;
import pageObjects.*;


public class CaseCreationStepDefinition extends MainDriver{
	
	public static WebDriver driver = getDriver();
	

	CaseTypePage casetype = PageFactory.initElements(driver,CaseTypePage.class);
	ProductSearchPage productSearch = PageFactory.initElements(driver,ProductSearchPage.class);
	
	@Before
	public void testSetup(Scenario scenario) {
		System.out.println("Starting the scenario: " + scenario.getName());
		driver = getDriver();
	}

	
	
    @Given("^I am at the Solvup login page$")
    public void navigateToSolvup() throws Throwable {
		driver = getDriver();	
                    driver.get("http://test-apps.solvup.com");
                    driver.manage().window().maximize();
    }

    @And("^I enter the serial number \"([^\"]*)\"$")
    public void enterSerialNumber(String serial_number) throws Throwable {
    	            productSearch.enterSerialNumber(serial_number);
                    Thread.sleep(2000);

    }
               

    @When("I login as {string}")
    public void login(String username) {
    	casetype.login(username);
    }

    
    @And("I enter the case type")
    public void enterCaseType(DataTable table) throws IOException, InterruptedException {
    	List<List<String>> data = table.asLists(String.class);

        WebElement element = (new WebDriverWait(driver, 40))

                                           .until(ExpectedConditions.elementToBeClickable(By.id("next_button_field")));

		for (int i = 1; i < data.size(); i++) {

			if (data.get(i).get(0).equals("Staff ID")) {

				casetype.enterTDC_PIN(data.get(i).get(1));

			}

			if (data.get(i).get(0).equals("Product Location")) {
				if (data.get(i).get(1).equals("At home")) {
					casetype.enterProductLocation("The item is at the customer's premises");
					Thread.sleep(1000);
					driver.findElement(By.xpath("//button[@id='item_athome_yes']")).click();
					Thread.sleep(1000);

				}

			}

			if (data.get(i).get(0).equals("Floorstock")) {

				if (data.get(i).get(1).equals("Yes")) {

					casetype.selectFloorstock();
					Select dropdown = new Select(
							driver.findElement(By.xpath("//select[@name='FloorStockSoldBefore']")));
					dropdown.selectByVisibleText("No");
				}

			}

			if (data.get(i).get(0).equals("FloorstockSoldBefore")) {

				if (data.get(i).get(1).equals("Yes")) {

					casetype.selectFloorstock();
					Select dropdown = new Select(
							driver.findElement(By.xpath("//select[@name='FloorStockSoldBefore']")));

					dropdown.selectByVisibleText("Yes");

				}

			}

			if (data.get(i).get(0).equals("RTV")) {

				if (data.get(i).get(1).equals("Yes")) {

					Thread.sleep(200);

					driver.findElement(By.xpath("//*[text()[contains(.,'RTV (Manual Credit)')]]")).click();

					Thread.sleep(500);

					driver.findElement(By.id("rtv_flow_continue_button")).click();

				}

			}

		}
	}
   
    @And("I click Next")
    public void clickNext() {
    	casetype.clickNext();
    }
    
    @And("^I enter \"([^\"]*)\" as search term$")
    public void searchSKU(String sku) throws InterruptedException {
    	productSearch.searchProduct(sku);
    }
    
    @Then("^I should land on page \"([^\"]*)\"$")
    public void checkForHeading(String exp_heading) throws Throwable {
                    if(exp_heading.equals("Repairer Select")){
                                    Thread.sleep(5000);
                    }
                    else{
                    WebElement element = (new WebDriverWait(driver, 40))
                                                       .until(ExpectedConditions.elementToBeClickable(By.id("next_button_field")));
                    }
    }
    
    @When("^I select the first search result$")
    public void selectFirstSearchResult() throws Throwable {
    	productSearch.selectProduct();
    }
    
    @After
    public void teardown() {
    	//driver.close();
    }

}
