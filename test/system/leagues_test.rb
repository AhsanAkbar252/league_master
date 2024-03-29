require "application_system_test_case"

class LeaguesTest < ApplicationSystemTestCase
  setup do
    @league = leagues(:one)
  end

  test "visiting the index" do
    visit leagues_url
    assert_selector "h1", text: "Leagues"
  end

  test "creating a League" do
    visit leagues_url
    click_on "New League"

    fill_in "Email", with: @league.email
    fill_in "Name", with: @league.name
    click_on "Create League"

    assert_text "League was successfully created"
    click_on "Back"
  end

  test "updating a League" do
    visit leagues_url
    click_on "Edit", match: :first

    fill_in "Email", with: @league.email
    fill_in "Name", with: @league.name
    click_on "Update League"

    assert_text "League was successfully updated"
    click_on "Back"
  end

  test "destroying a League" do
    visit leagues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "League was successfully destroyed"
  end
end
