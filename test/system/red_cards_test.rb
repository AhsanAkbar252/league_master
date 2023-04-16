require "application_system_test_case"

class RedCardsTest < ApplicationSystemTestCase
  setup do
    @red_card = red_cards(:one)
  end

  test "visiting the index" do
    visit red_cards_url
    assert_selector "h1", text: "Red Cards"
  end

  test "creating a Red card" do
    visit red_cards_url
    click_on "New Red Card"

    fill_in "Game", with: @red_card.game_id
    fill_in "Player", with: @red_card.player_id
    fill_in "Time", with: @red_card.time
    click_on "Create Red card"

    assert_text "Red card was successfully created"
    click_on "Back"
  end

  test "updating a Red card" do
    visit red_cards_url
    click_on "Edit", match: :first

    fill_in "Game", with: @red_card.game_id
    fill_in "Player", with: @red_card.player_id
    fill_in "Time", with: @red_card.time
    click_on "Update Red card"

    assert_text "Red card was successfully updated"
    click_on "Back"
  end

  test "destroying a Red card" do
    visit red_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Red card was successfully destroyed"
  end
end
