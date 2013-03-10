Feature: Merge Articles
  As a blog administrator
  I want to merge article with similar content.
  The merged article should contain the text of both previous articles.
  The merged article should contain one author, either one of both previous articles.
  The comments of previous articles should be carry to the new merged article.
  The title of the merged article should the title of either one of previous articles.

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully write articles
    Given I am on the new article page
    When I fill in "article_title" with "First"
    And I fill in "article__body_and_extended_editor" with "First Article"
    And I press "Publish"
    Given I am on the new article page
    When I fill in "article_title" with "Second"
    And I fill in "article__body_and_extended_editor" with "Second Article"
    And I press "Publish"
    Given I am on the manage articles page
    Then I should see "First"
    When I follow "First"
    And I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "First"
    When I follow "First"
    Then I should see "Second Article"
