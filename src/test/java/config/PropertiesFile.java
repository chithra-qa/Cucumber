package config;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesFile {
	
	public static void getProperties() throws Exception {
		Properties prop = new Properties();
		String projectPath = System.getProperty("user.dir");
		InputStream input = new FileInputStream(projectPath+"/Solvup/src/test/java/config/config.properties");
		prop.load(input);
		String browser = prop.getProperty("browser");		
	}

}
