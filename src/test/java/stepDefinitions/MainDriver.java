package stepDefinitions;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;

import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import io.cucumber.core.api.Scenario;
import io.cucumber.java.Before;

public class MainDriver {
	
	public static WebDriver driver;

	String projectDir = System.getProperty("user.dir");

	public static WebDriver getDriver() {

		if (driver == null) {
			System.setProperty("webdriver.chrome.driver", "/home/chithra/Downloads/chromedriver");
			ChromeOptions options = new ChromeOptions();
			driver = new ChromeDriver(options);
		}

		return driver;

	}
}
