@testing @directions
Feature: Validate Directions
  As a user
  I want to navigate in google maps
  So that I can validate that my direction exists

  @test#1 @sunny_day
  Scenario: Navigate to location success
    Given the user accesses google maps
    When search for location "Dublin"
    Then search results is accordingly "Dublin"
