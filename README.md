# GoRest API Test Automation Framework

An API Test Automation framework built using **Karate DSL**, **Java 21**, **JUnit 5**, **Maven**, and **Gradle**. This suite tests the RESTful services at [GoRest API](https://gorest.co.in).

---

## 📁 Project Structure

```text
test-automation/
├── pom.xml                                   # Maven configuration file
├── build.gradle                              # Gradle build configuration
├── README.md                                 # Project documentation
└── src/
    └── test/
        └── java/
            ├── karate-config.js               # Karate global configuration
            ├── logback-test.xml               # Logback logging configuration
            └── examples/
                ├── TestRunner.java           # Runner class for executing ALL scenarios
                ├── CaseRunner.java           # Runner class for case-by-case execution
                └── gorestUser.feature        # Karate BDD Feature Scenarios
```

---

## ⚙️ Prerequisites

- **Java JDK 21+** (e.g. Eclipse Adoptium OpenJDK 21)
- **Apache Maven** or **Gradle 8.8+**
- **GoRest API Token** (configured in `karate-config.js`)

---

## 🧪 Test Scenarios Covered

The feature file [`src/test/java/examples/gorestUser.feature`](file:///c:/Users/User/Desktop/test-automation/src/test/java/examples/gorestUser.feature) contains the following BDD automation scenarios:

| Tag | Scenario | Description |
| :--- | :--- | :--- |
| `@createEmployee` | **Create Employee** | Sends a `POST` request with dynamic email generation and verifies that the returned `id` is in **numerical format** (`#number`). |
| `@getUser` | **Get User by ID** | Sends a `GET` request to retrieve user details and verifies schema response types. |
| `@getUsers` | **Get All Users** | Sends a `GET` request to retrieve all users and verifies array response structure. |

---

## 🚀 Running Tests via Maven

### Run ALL Scenarios Together:
```bash
mvn test -Dtest=TestRunner
```

### Run Case-by-Case (Specific Test Method):
- **Create Employee scenario:**
  ```bash
  mvn test -Dtest=CaseRunner#testCreateEmployee
  ```
- **Get User By ID scenario:**
  ```bash
  mvn test -Dtest=CaseRunner#testGetUserById
  ```
- **Get All Users scenario:**
  ```bash
  mvn test -Dtest=CaseRunner#testGetAllUsers
  ```

---

## 🐘 Running Tests via Gradle

### Run ALL Scenarios Together:
```bash
gradle test --tests "examples.TestRunner"
```

### Run Case-by-Case (Specific Test Method):
- **Create Employee scenario:**
  ```bash
  gradle test --tests "examples.CaseRunner.testCreateEmployee"
  ```
- **Get User By ID scenario:**
  ```bash
  gradle test --tests "examples.CaseRunner.testGetUserById"
  ```
- **Get All Users scenario:**
  ```bash
  gradle test --tests "examples.CaseRunner.testGetAllUsers"
  ```

---

## 📊 Viewing HTML Test Reports

After executing tests, interactive HTML reports are generated automatically:

1. **Karate Interactive HTML Summary Report:**
   - Location: [`build/karate-reports/karate-summary.html`](file:///c:/Users/User/Desktop/test-automation/build/karate-reports/karate-summary.html)
   - Features full HTTP request/response payloads, headers, status codes, and execution timings.

2. **Gradle HTML Test Report:**
   - Location: [`build/reports/tests/test/index.html`](file:///c:/Users/User/Desktop/test-automation/build/reports/tests/test/index.html)
