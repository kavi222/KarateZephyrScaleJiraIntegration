package testrunners;

import static org.junit.Assert.assertTrue;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
//import com.intuit.karate.junit4.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ApiTestRunner {
	@Test
	public void testParallel() {
		Results results = Runner.path("resources/features").tags("@booking").outputCucumberJson(true)			
				.outputJunitXml(true).parallel(1);
		generateReport(results.getReportDir());
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);

	}
	

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		final List<String> jsonPaths = new ArrayList(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "booker");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}

}
