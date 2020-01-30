package stepDefinitions;

 

 

import org.openqa.selenium.WebDriver;

 

import org.openqa.selenium.chrome.ChromeDriver;

import org.openqa.selenium.chrome.ChromeOptions;

 

public class AbstractStepDefinition {

           

                private static WebDriver driver;

                String projectDir = System.getProperty("user.dir");

                protected WebDriver getDriver(){

                    if(driver==null){

                      System.setProperty("webdriver.chrome.driver", "/home/chithra/Downloads/chromedriver");

                      ChromeOptions options = new ChromeOptions();

                      driver = new ChromeDriver(options);

                     }

                    return driver;

                }
             
}

 

 