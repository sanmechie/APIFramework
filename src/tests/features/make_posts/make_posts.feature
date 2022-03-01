Feature: Test Make Post feature for jsonplaceholder service

Background:
    Given I Set JSON Place Holder Service URL


Scenario Outline: Verify 201 Status code for succesfully creating a POST with valid payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve "201" as HTTP code
    Examples: request_body
      |payload|
      |{"title": "MyPost", "body": "Hi this is post", "userId": 1}|

#Here depending upon on specification  we can validate multiple response headers
Scenario Outline: Verify server is cloudfare in response header when a post is created with valid payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve header containing "server" as "cloudflare"
    Examples: request_body
      |payload|
      |{"title": "MyPost", "body": "Hi this is post", "userId": 1}|

Scenario Outline: Verify response data for creating a post for existing user with correct payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then following details are returned
    Examples: request_body
      |payload|
      |{"title": "MyPost", "body": "Hi this is post", "userId": 1}|


# here since expected payload as per document should title, body and userID fields
# but the end point is accepting any payload, hence this scenario will fail
# negative scenario: Invalid payload
Scenario Outline: Verify 400 error is thrown while creating a post with incorect payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve "400" as HTTP code
    Examples: request_body
      |payload|
      |{"titles": "MyPost", "bod": "Hi this is post", "user": 1}|

# Here since there is no documented behavior, the standard response time is between 0.1 to 1 second
# So i am asserting based on standard documented behavior
Scenario Outline: Verify response time is less than 1 second
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve response time less than "1" second
    Examples: request_body
      |payload|
      |{"titles": "MyPost", "bod": "Hi this is post", "user": 1}|

# Other Scenarios
# Also since the specification is not clear and values are not getting persistent, 
# a post shouldnt be allowed to be created for a non-existent user 
# but here this service is allowing to create a post for non-existent user
# also since the data is not persistent, cannot retrieve the post from Get request
