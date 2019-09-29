package pageObjects;

 

import static org.junit.Assert.assertTrue;

 

import org.openqa.selenium.By;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.support.ui.Select;

 

public class ActionsPageObjects {

               

                    WebDriver driver = null;

                   

        By email = By.id("email1");

        By login = By.xpath("//button[@type='submit']");

        By couponCode = By.id("couponCode1");

        By submit = By.xpath("//button[@type='submit']");

        By checkbox = By.xpath("//input[@value='checkbox1']");

        By clickElement = By.xpath("//button[contains(text(),'Click to toggle popover')]");

        By dropdown = By.xpath("//select[@class='form-control action-select']");

        By textClear = By.id("description");

       

        public ActionsPageObjects(WebDriver driver) {

               this.driver = driver;       

        }

       

        public void performType(String emailId) {

               driver.findElement(email).sendKeys(emailId);

        }

       

        public void performClick() {

               driver.findElement(clickElement).click();

        }

       

        public void performSubmit() {

               driver.findElement(couponCode).sendKeys("12345");

               driver.findElement(submit).click();

        }

       

        public void performCheck() {

               driver.findElement(checkbox).click();

        }

       

        public void checkEmail(String email_exp) {

               boolean emailMatch = driver.findElement(email).getAttribute("value").equalsIgnoreCase(email_exp);

               assertTrue(emailMatch);

        }

        public void performClear() {

               driver.findElement(textClear).sendKeys("Clear this text");

        }

       

        public void performSelect() {

                                ActionsPage.dropdown(driver).selectByVisibleText("bananas");

        }

       

}
