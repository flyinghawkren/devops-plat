*** settings ***
Library  REST  http://100.100.0.10:30100

*** test cases ***
simpleRequest
    GET  /add?a=1&b=2
    REST.Integer  response body  3