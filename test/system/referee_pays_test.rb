require "application_system_test_case"

class RefereePaysTest < ApplicationSystemTestCase
  setup do
    @referee_pay = referee_pays(:one)
  end

  test "visiting the index" do
    visit referee_pays_url
    assert_selector "h1", text: "Referee Pays"
  end

  test "creating a Referee pay" do
    visit referee_pays_url
    click_on "New Referee Pay"

    fill_in "Amount", with: @referee_pay.amount
    fill_in "Level", with: @referee_pay.level_id
    fill_in "Position", with: @referee_pay.position_id
    click_on "Create Referee pay"

    assert_text "Referee pay was successfully created"
    click_on "Back"
  end

  test "updating a Referee pay" do
    visit referee_pays_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @referee_pay.amount
    fill_in "Level", with: @referee_pay.level_id
    fill_in "Position", with: @referee_pay.position_id
    click_on "Update Referee pay"

    assert_text "Referee pay was successfully updated"
    click_on "Back"
  end

  test "destroying a Referee pay" do
    visit referee_pays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referee pay was successfully destroyed"
  end
end
