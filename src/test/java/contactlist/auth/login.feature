Feature: Reutilización de autenticación

  Scenario: Obtener token de acceso
    Given url baseUrl
    And path 'users/login'
    And request { email: 'test@fake.com', password: 'myPassword' }
    When method post
    Then status 200
    # Guardamos el token para exportarlo
    * def authToken = response.token