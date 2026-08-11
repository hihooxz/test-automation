Feature: GoRest User / Collabera QA Test Engineer

  Background:
    * url baseUrl
    * header Authorization = authToken
    * header Accept = 'application/json'

    @createEmployee
  Scenario: Create a new employee entry and verify numerical ID format
    * def randomEmail = 'employee_' + java.lang.System.currentTimeMillis() + '@example.com'
    * def employeePayload = 
    """
    {
      "name": "Jane Smith",
      "gender": "female",
      "email": "#(randomEmail)",
      "status": "active"
    }
    """
    Given path '/public/v2/users'
    And request employeePayload
    When method post
    Then status 201

    * print 'API Response Status:', responseStatus
    * print 'API Response Body:', response
    * print 'Created Employee ID:', response.id

   
    And match response.id == '#number'
    
    And match response.name == 'Jane Smith'
    And match response.gender == 'female'
    And match response.email == randomEmail
    And match response.status == 'active'

    @getUser
  Scenario: Get user by ID
    Given path '/public/v2/users/8574858'
    When method get
    Then status 200

    * def expectedUser = 
    """
    {
      "id": 8574858,
      "name": "Jane Smith",
      "email": "employee_1786382919550@example.com",
      "gender": "female",
      "status": "active"
    }
    """

   
    * print 'API Response Status:', responseStatus
    * print 'Actual Response Body:', response
    * print 'Expected Response Body:', expectedUser

    
    And match response == expectedUser

    @getUsers
  Scenario: Get all users list and verify status is active or inactive
    Given path '/public/v2/users'
    When method get
    Then status 200

    * print 'API Response Status:', responseStatus
    * print 'API Response Body:', response

    And match response == '#array'
 
    And match response[0].status == '#regex active|inactive'

    And match each response == { id: '#number', name: '#string', email: '#string', gender: '#string', status: '#regex active|inactive' }

    @updateUser

  Scenario: Update existing user
    * def employeePayload = 
    """
    {
     "name": "Avantika Shahaa", 
     "status": "inactive" 
    }
    """
    Given path '/public/v2/users/8574930'
    And request employeePayload
    When method put
    Then status 200

    * print 'API Response Status:', responseStatus
    * print 'API Response Body:', response

        * def expectedUser = 
    """
    {
      "id": 8574930,
      "name": "Avantika Shahaa",
      "email": "shah_avantika@raynor.example",
      "gender": "female",
      "status": "inactive"
    }
    """

    
    * match response == expectedUser
