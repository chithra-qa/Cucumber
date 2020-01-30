package pages;

 

import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.ISelect;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.Test;

import utils.*;

public class CaseCreationPage {
	
	            static WebDriver driver;

	            @FindBy(id="UserIdentifier")
	            WebElement username;
                
                @FindBy(id="UserPassword")
                WebElement password;
                
                @FindBy(xpath="//button[contains(text(),'Login')]")
                WebElement loginBtn;
                
                @FindBy(id="Request_staff_id_sv")
                WebElement TDC;
                
                @FindBy(id="Request_staff_code_sv")
                WebElement PIN;
                
                @FindBy(xpath="//button[contains(text(),'Continue')]")
                WebElement continueBtn;
                
                @FindBy(id="announcement_hide")
                WebElement hideAnnBtn;
                
                @FindBy(id="next_button_field")
                WebElement nextBtn;
                
                @FindBy(xpath="//select[@name='ProductLocation']")
                WebElement locationDropdown;

                public CaseCreationPage(WebDriver driver) {
                                this.driver =driver;
                }
                


                
                public void login(String User) {  
                	WebElement element1 = (new WebDriverWait(driver, 40))

                            .until(ExpectedConditions.elementToBeClickable(username));
                	 username.sendKeys(User);
                	 password.sendKeys("pass");
                	 loginBtn.click();
                	 continueBtn.click();
                	 WebElement element2 = (new WebDriverWait(driver, 40))
                             .until(ExpectedConditions.elementToBeClickable(hideAnnBtn));
                	 hideAnnBtn.click();


                }
                
                public void enterTDC_PIN(String tdc) {
                	WebElement element = (new WebDriverWait(driver, 40))
                            .until(ExpectedConditions.elementToBeClickable(PIN));
                	TDC.sendKeys(tdc);
                	PIN.sendKeys("pass");
				}
                
                public void enterProductLocation(String location) {
                	Select dropdown = new Select(locationDropdown);
                	dropdown.selectByVisibleText(location);					
				}
                
                public void clickNext() {
                	WebElement element = (new WebDriverWait(driver, 40))
                            .until(ExpectedConditions.elementToBeClickable(nextBtn));
                	nextBtn.click();				
				}
}

 
