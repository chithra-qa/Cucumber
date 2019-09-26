package stepDefinitions;


import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
 

public class AbstractStepDefinition {
            
                private static WebDriver driver;

                protected WebDriver getDriver(){

                    if(driver==null){
                      String chromeDriverPath = "/home/chithra/Documents/Cucumber/chromedriver";
                      System.setProperty("webdriver.chrome.driver", chromeDriverPath);
                      ChromeOptions options = new ChromeOptions();
                      driver = new ChromeDriver(options);
                     }
                    return driver;
                }
}


