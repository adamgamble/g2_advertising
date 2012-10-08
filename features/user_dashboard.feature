Feature: User dashboard

  Scenario: Dashboard should list users stores
    Given a user exists
    And that user is related to the following stores:
      | Store Name      |
      | Piggly Wiggly   |
      | Foodland        |
    When I login as that user
    And I am on the user dashboard
    Then I should see my stores listed by name

  Scenario: Dashboard should list proofs for each store
    Given a user exists
    And that user has 1 stores with proofs
    When I login as that user
    And I am on the user dashboard
    Then I should see the proofs listed under their respective stores

  Scenario: Dashboard should list proofs for each store
    Given a user exists
    And that user has 1 stores with proofs
    When I login as that user
    And I am on the user dashboard
    Then I should see the proofs in home and print date listed as mm-dd-yy
