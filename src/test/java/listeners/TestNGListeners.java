package listeners;

import java.io.File;
import java.io.IOException;

import org.apache.commons.collections4.FactoryUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.testng.ITestListener;
import org.testng.ITestNGListener;
import org.testng.ITestResult;

import com.google.common.io.Files;

import io.cucumber.testng.CucumberFeatureWrapper;
import stepDefinitions.MainDriver;

public class TestNGListeners extends MainDriver implements ITestListener{
	
	public void onTestStart (ITestResult result) {
		System.out.println("Test started");
	}
	
	public void onTestFailure (ITestResult result) {
		TakesScreenshot scrShot =((TakesScreenshot) driver);
		File SrcFile=scrShot.getScreenshotAs(OutputType.FILE);

		File DestFile=new File("/home/chithra/Desktop/SeleniumScreenshots/"+result.getName()+".png");
		try {
			Files.copy(SrcFile, DestFile);
		} catch (IOException e) {
			e.printStackTrace();
	  }
		
	}
	

}
