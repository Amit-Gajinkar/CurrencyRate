Feature: Exchange Rate API Verification

  Background:
    * url 'https://open.er-api.com/v6/latest/USD'
    When method get

    @Smoke
    Scenario Outline: Check API Call is successful and returns valid price
      Then status 200
      And match responseType == 'json'
      * def nested_data = karate.jsonPath(response,"$..['rates']")
      And match nested_data == '#[]? _.'+__row["name"]+'> 0'
    Examples:
      | read('../data/currency.json') |

    @Smoke
    Scenario: Check API status and status code
      And assert responseStatus==200
      * match ([responseStatus]) contains any [ 200, 202, 400 ]
      * def stat = response.result
      * match ([stat]) contains any [ 'success', 'failure' ]

    @Smoke
    Scenario: Fetch and Verify USD price against AED from API
      Then status 200
      And match responseType == 'json'
      * def aed_rate = response.rates["AED"]
      * print aed_rate
      * assert 3.6<=aed_rate<=3.7

    @Smoke
    Scenario: Verify API Response Time
      Then status 200
      And match responseType == 'json'
      * print responseTime
      * def currentTime = (responseTime/1000) < 3 ? responseTime+" msec" : responseTime/1000+" sec"
      * print currentTime

    @Smoke
    Scenario: Verify 162 currency pairs are returned in API response
      Then status 200
      And match responseType == 'json'
      * def cur_pair_length = $..rates[*]
      * print cur_pair_length.length
      * assert cur_pair_length.length==162