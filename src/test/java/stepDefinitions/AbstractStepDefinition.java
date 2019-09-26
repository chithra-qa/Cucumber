package stepDefinitions;

 

import java.net.MalformedURLException;

import java.net.URI;

 

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import org.openqa.selenium.firefox.FirefoxProfile;

import org.openqa.selenium.ie.InternetExplorerDriver;

import org.openqa.selenium.remote.CapabilityType;

import org.openqa.selenium.remote.CommandExecutor;

import org.openqa.selenium.remote.DesiredCapabilities;

import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.URL;

 

import cucumber.api.java.After;

 

public class AbstractStepDefinition {

               

                protected static WebDriver driver;

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


