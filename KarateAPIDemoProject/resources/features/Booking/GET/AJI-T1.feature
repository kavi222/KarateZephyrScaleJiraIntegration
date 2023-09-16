@booking
Feature: Get list of bookingid

  Background: 
    * configure afterScenario = function(){ karate.call('classpath:testrunners/Jira.feature',{ status: karate.info.errorMessage, TestCaseID: 'AJI-T1'}); }
    * configure ssl = true

  Scenario: Get list of bookingid
    And url baseURL
    When path getListOfBookings
    And header Content-Type = contentType
    When method GET
    Then status 200
    * def expResponse = read(getListOfBookingsSchema)
    * print "*****INFO:Compare Actual and Expected value*****"
    * match response == '#[]expResponse'
