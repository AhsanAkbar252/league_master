require "application_system_test_case"

class RefereePositionsTest < ApplicationSystemTestCase
  setup do
    @referee_position = referee_positions(:one)
  end

  test "visiting the index" do
    visit referee_positions_url
    assert_selector "h1", text: "Referee Positions"
  end

  test "creating a Referee position" do
    visit referee_positions_url
    click_on "New Referee Position"

    fill_in "Name", with: @referee_position.name
    click_on "Create Referee position"

    assert_text "Referee position was successfully created"
    click_on "Back"
  end

  test "updating a Referee position" do
    visit referee_positions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @referee_position.name
    click_on "Update Referee position"

    assert_text "Referee position was successfully updated"
    click_on "Back"
  end

  test "destroying a Referee position" do
    visit referee_positions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referee position was successfully destroyed"
  end
end
