Feature: Merge Articles
  As a blog administrator
  In order to relate the blog articles
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And two articles with comments are created
    And I am logged as a admin user
    And I am editing first article page
    And I should see "Merge Articles"
    When I merge with article 2

  Scenario: Merged article should contain the text of both previous articles
    When I am on merged article page
    Then I should see "Article 1 Text"
    And I should see "Article 2 Text"

  Scenario: Merged article should have one author
    When I am on user 1 article list page
    Then I should see "Article 1 Title"

  Scenario: Comments on each of the two original articles need to point the merged article
    When I am on merged article comment page
    Then I should see "Comment Article 1"
    And I should see "Comment Article 2"

  Scenario: The title of the new article should be the title from either one of the merged articles
    When I am on merged article page
    Then I should see title "Article 1 Title"

