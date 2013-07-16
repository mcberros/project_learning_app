Feature: Manage projects
  In order to describe projects
  A user
  Wants to manage an project
  
  Scenario: Create new project
    Given I am on the new project page
    When I fill in "Name" with "Project 1"
    And I fill in "Description" with "Dummy"
    And I press "Create Project"
    Then I should see "Successfully created project."
    
   Scenario: List projects
    Given I am on the projects page
    Then I should see "No projects found."
    Given a project
    When I am on the projects page
    Then I should see the project