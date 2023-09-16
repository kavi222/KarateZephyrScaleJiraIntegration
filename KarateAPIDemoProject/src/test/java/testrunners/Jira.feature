Feature: To update Jira results

  Scenario: Update test results to Jira
    * def testCycleID = testCycleID
    Given url jiraUrl
    And header Authorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL2thdmkyMi5hdGxhc3NpYW4ubmV0IiwidXNlciI6eyJhY2NvdW50SWQiOiI3MTIwMjA6MDMyYWRiM2UtNjMwNi00ZWIyLTkzZWMtOGUwMzFlN2ZjYTJjIn19LCJpc3MiOiJjb20ua2Fub2FoLnRlc3QtbWFuYWdlciIsInN1YiI6ImJjNWY3NzQ1LWU3NTQtMzUxMC1iZjEwLTJjOWU0MjU0NjA2ZCIsImV4cCI6MTcyNjMzNDkyNSwiaWF0IjoxNjk0Nzk4OTI1fQ.Gkjpp_LkPAmuBXWWYCJcVH_p5ASasd_8YoaH4mf58MM'
    And header Content-Type = contentType
    * def tstatus = null == status ? 'Pass' : 'Fail'
    * def tcomment = null == status ? 'Test executed successfully' : status
    * def jiraPayload = read('classpath:requestpayload/jira.json')
    * set jiraPayload.testCaseKey = TestCaseID
    * set jiraPayload.testCycleKey = testCycleID
    * set jiraPayload.statusName = tstatus
    * set jiraPayload.actualResult = tcomment
    And request jiraPayload
    When method POST