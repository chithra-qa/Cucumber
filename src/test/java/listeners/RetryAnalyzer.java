package listeners;
import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
 
import org.testng.IAnnotationTransformer;
import org.testng.annotations.ITestAnnotation;
 
public class RetryAnalyzer implements IRetryAnalyzer {
	 
	  private int retryCount = 0;
	  private static final int maxRetryCount = 3;
	 
	  public boolean retry(ITestResult result) {
	    if (retryCount < maxRetryCount) {
	      retryCount++;
	      return true;
	    }
	    return false;
	  }
	}
