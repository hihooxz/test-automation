package examples;

import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

class CaseRunner {

    // Case 1: Create Employee
    @Test
    void testCreateEmployee() {
        SuiteResult result = Runner.path("classpath:examples/gorestUser.feature")
            .tags("@createEmployee")
            .outputHtmlReport(true)
            .parallel(1);
        assertTrue(result.isPassed());
    }

    // Case 2: Get User By ID
    @Test
    void testGetUserById() {
        SuiteResult result = Runner.path("classpath:examples/gorestUser.feature")
            .tags("@getUser")
            .outputHtmlReport(true)
            .parallel(1);
        assertTrue(result.isPassed());
    }

    // Case 3: Get All Users
    @Test
    void testGetAllUsers() {
        SuiteResult result = Runner.path("classpath:examples/gorestUser.feature")
            .tags("@getUsers")
            .outputHtmlReport(true)
            .parallel(1);
        assertTrue(result.isPassed());
    }
}
