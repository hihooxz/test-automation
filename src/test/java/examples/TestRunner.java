package examples;

import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

class TestRunner {

    // Run ALL test cases at once (All Scenarios)
    @Test
    void testAll() {
        SuiteResult result = Runner.path("classpath:examples")
            .outputHtmlReport(true)
            .parallel(1);
        assertTrue(result.isPassed());
    }
}
