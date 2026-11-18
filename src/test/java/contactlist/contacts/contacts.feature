Feature: Pruebas de Funcionalidad de Contactos

  Background:
    # 1. Llamar al feature de autenticación y capturar el token
    * def authResult = call read('classpath:contactlist/auth/login.feature')
    * def validToken = authResult.authToken
    # 2. Configurar la URL base y el header de Autorización para todos los escenarios
    * url baseUrl
    * header Authorization = 'Bearer ' + validToken

  Scenario: Crear un contacto nuevo exitosamente (CP-005)
    Given path 'contacts'
    And request
    """
    {
      "firstName": "John",
      "lastName": "Doe",
      "birthdate": "1970-01-01",
      "email": "jdoe@example.com",
      "phone": "8005555555",
      "street1": "1 Main St.",
      "street2": "Apartment A",
      "city": "Anytown",
      "stateProvince": "KS",
      "postalCode": "12345",
      "country": "USA"
    }
    """
    When method post
    Then status 201
    # Validaciones de respuesta
    And match response.firstName == 'John'
    And match response._id == '#present'
    And match response._id == '#string'

  Scenario: Obtener la lista de contactos (CP-007)
    Given path 'contacts'
    When method get
    Then status 200
    # Valida que la respuesta sea un arreglo de contactos
    And match response == '#array'