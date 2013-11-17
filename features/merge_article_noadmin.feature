Feature: Control merge Articles
  As a blog administrator
  In order to control de article merge feature
  I don't want nonadmin users to be able to merge articles

  Scenario: A non-admin user cannot merge articles
    Given the blog is set up
    And two articles with comments are created
    And a non-admin user exists
    And I am logged as a non-admin user
    When I am on edit first article page
    Then I should not see "Merge Articles"

