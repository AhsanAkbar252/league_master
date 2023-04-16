require "application_system_test_case"

class YellowCardsTest < ApplicationSystemTestCase
  setup do
    @yellow_card = yellow_cards(:one)
  end

  test "visiting the index" do
    visit yellow_cards_url
    assert_selector "h1", text: "Yellow Cards"
  end

  test "creating a Yellow card" do
    visit yellow_cards_url
    click_on "New Yellow Card"

    fill_in "Game", with: @yellow_card.game_id
    fill_in "Player", with: @yellow_card.player_id
    fill_in "Time", with: @yellow_card.time
    click_on "Create Yellow card"

    assert_text "Yellow card was successfully created"
    click_on "Back"
  end

  test "updating a Yellow card" do
    visit yellow_cards_url
    click_on "Edit", match: :first

    fill_in "Game", with: @yellow_card.game_id
    fill_in "Player", with: @yellow_card.player_id
    fill_in "Time", with: @yellow_card.time
    click_on "Update Yellow card"

    assert_text "Yellow card was successfully updated"
    click_on "Back"
  end

  test "destroying a Yellow card" do
    visit yellow_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yellow card was successfully destroyed"
  end
end
