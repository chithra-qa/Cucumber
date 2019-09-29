package pageObjects;

 

import java.util.List;

 

import org.openqa.selenium.By;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.WebElement;

import org.openqa.selenium.support.ui.Select;

 

public class ActionsPage {

                private static WebElement element = null;

               

                public static WebElement email(WebDriver driver) {

                                element = driver.findElement(By.id("email1"));

                                return element;

                }

 

                public static WebElement textarea(WebDriver driver) {

                                element = driver.findElement(By.xpath("//textarea"));

                                return element;

                }

               

                public static WebElement couponSubmitted(WebDriver driver) {

                                element = driver.findElement(By.xpath("//p[contains(text(),'Your form has been submitted')]"));

                                return element;

                }

               

                public static WebElement checkbox(WebDriver driver) {

                                element = driver.findElement(By.xpath("//input[@value='checkbox1']"));

                                return element;

                }

               

                public static Select dropdown(WebDriver driver) {

                                Select element = new Select (driver.findElement(By.xpath("//select[@class='form-control action-select']")));

                                return element;

                }

                public static WebElement clickPopover(WebDriver driver) {

                                element = driver.findElement(By.xpath("//h3[@class='popover-title']"));

                                return element;

                }

               

                public static WebElement textClear(WebDriver driver) {

                                element = driver.findElement(By.id("description"));

                                return element;

                }

               

                public static WebElement actions(WebDriver driver) {

                                List<WebElement> li = driver.findElements(By.xpath("//a[contains(text(),'Actions')]"));

                                element = li.get(1);

                                return element;

                }

 

}

 
