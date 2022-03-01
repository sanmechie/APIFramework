Feature: Test comment on Post feature for jsonplaceholder service

Background:
    Given I Set JSON Place Holder Service URL


Scenario Outline: Verify 201 Status code for succesfully commenting on a Post with valid payload
    Given I Set "POST" "comments" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve "201" as HTTP code
    Examples: request_body
      |payload|
      |{"postId": 1, "name": "tony", "email": "Tony@gardner.biz", "body": "This is Sample body"}|

#By default POST requests are not cacheable
# but depending upon specification we can change this behavior
Scenario Outline: Verify no-cache control is in place for Cache control
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve header containing "Cache-Control" as "no-cache"
    Examples: request_body
      |payload                                                                                  |
      |{"postId": 1, "name": "tony", "email": "Tony@gardner.biz", "body": "This is Sample body"}|

Scenario Outline: Verify response data for creating commenting on a post for existing user with correct payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then following details are returned
    Examples: request_body
      |payload                                                                                  |                                                                                  
      |{"postId": 1, "name": "tony", "email": "Tony@gardner.biz", "body": "This is Sample body"}|



# here since expected payload as per document should postId, name , body and email fields
# but the end point is accepting any payload, hence this scenario will fail
# invalid payload -negative scenario
Scenario Outline: Verify 400 error is thrown while commenting on a post with incorect payload
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
     Then I recieve "400" as HTTP code
    Examples: request_body
      |payload                                                                                      |
      |{"postIds": 1, "names": "tony", "emails": "Tony@gardner.biz", "bodys": "This is Sample body"}|


# postid doesn't exist -negative scenario
Scenario Outline: Verify 400 error is thrown while creating commenting on a post which doesn't exist
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve "400" as HTTP code
    Examples: request_body
      |payload                                                                                    |
      |{"postId": -99, "name": "tony", "email": "Tony@gardner.biz", "body": "This is Sample body"}|


# Here since there is no documented behavior, the standard response time is between 0.1 to 1 second
# So i am asserting based on standard documented behavior
Scenario Outline: Verify response time is less than 1 second
    Given I Set "POST" "posts" api endpoint users
    When I Set HEADER param request content type as "application/json"
    And set a "<payload>"
    And Send HTTP request
    Then I recieve response time less than "1" second
    Examples: request_body
      |payload                                                                                    |
      |{"postId": -99, "name": "tony", "email": "Tony@gardner.biz", "body": "This is Sample body"}|

# # Other Scenarios
# # Also since the specification is not clear and values are not getting persistent, 
# # a comment shouldnt be allowed to be created for a non-existent user 
# # but here this service is allowing to commnent on a post for non-existent user