require "application_system_test_case"

class TeamPlayersTest < ApplicationSystemTestCase
  setup do
    @team_player = team_players(:one)
  end

  test "visiting the index" do
    visit team_players_url
    assert_selector "h1", text: "Team Players"
  end

  test "creating a Team player" do
    visit team_players_url
    click_on "New Team Player"

    click_on "Create Team player"

    assert_text "Team player was successfully created"
    click_on "Back"
  end

  test "updating a Team player" do
    visit team_players_url
    click_on "Edit", match: :first

    click_on "Update Team player"

    assert_text "Team player was successfully updated"
    click_on "Back"
  end

  test "destroying a Team player" do
    visit team_players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team player was successfully destroyed"
  end
end
