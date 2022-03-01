Feature: Test Get User feature for jsonplaceholder service

Background:
    Given I Set JSON Place Holder Service URL

Scenario: Verify 200 Status code for Get Users
    Given I Set "GET" "users" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And Send HTTP request
    Then I recieve "200" as HTTP code

#Here depending upon on specification  we can validate multiple response headers
Scenario: Verify header content-type for Get users
    Given I Set "GET" "users" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And Send HTTP request
    Then I recieve header containing "content-type" as "application/json; charset=utf-8"
    

Scenario Outline: Verify 404 Status code is returned user who doesnt exist
    Given I Set "GET" "<users>" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And Send HTTP request
    Then I recieve "404" as HTTP code 
    And I recieve empty response
    Examples: endpoints
      |users|
      |users/100|
      |users/-99|
      |users/abc|
      |users/%|

# Here we are validating the json body for list users response
Scenario: Verify json body and fields  for Get Users
    Given I Set "GET" "users" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And Send HTTP request
    Then I recieve a valid user_schema as json response
        """
        {"id": {"type": "number"}, "name": {"type": "string"}, "username": {"type": "string"},
        "email": {"type": "string"}, "address": {"type": "dict",
                                          "schema": {"street": {"type": "string"},
                                                     "suite": {"type": "string"},
                                                     "city": {"type": "string"},
                                                     "zipcode": {"type": "string"},
                                                     "geo": {"type": "dict",
                                                             "schema": {
                                                                 "lat": {"type": "string"},
                                                                 "lng": {"type": "string"}
                                                             }
                                                             }
                                                     }},
        "phone": {"type": "string"},
        "website":{"type": "string"},
        "company":{"type": "dict",
                    "schema": {
                    "name": {"type": "string"},
                    "catchPhrase": {"type": "string"},
                    "bs": {"type": "string"}
                    }
                    } 
        }
        """

Scenario: Verify response time is less than 1 second
    Given I Set "GET" "users" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And Send HTTP request
    Then I recieve response time less than "1" second