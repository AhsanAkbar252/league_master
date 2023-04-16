require "application_system_test_case"

class RefereeLevelsTest < ApplicationSystemTestCase
  setup do
    @referee_level = referee_levels(:one)
  end

  test "visiting the index" do
    visit referee_levels_url
    assert_selector "h1", text: "Referee Levels"
  end

  test "creating a Referee level" do
    visit referee_levels_url
    click_on "New Referee Level"

    fill_in "Name", with: @referee_level.name
    click_on "Create Referee level"

    assert_text "Referee level was successfully created"
    click_on "Back"
  end

  test "updating a Referee level" do
    visit referee_levels_url
    click_on "Edit", match: :first

    fill_in "Name", with: @referee_level.name
    click_on "Update Referee level"

    assert_text "Referee level was successfully updated"
    click_on "Back"
  end

  test "destroying a Referee level" do
    visit referee_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referee level was successfully destroyed"
  end
end
