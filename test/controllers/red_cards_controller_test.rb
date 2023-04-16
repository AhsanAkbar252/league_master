require "test_helper"

class RedCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @red_card = red_cards(:one)
  end

  test "should get index" do
    get red_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_red_card_url
    assert_response :success
  end

  test "should create red_card" do
    assert_difference('RedCard.count') do
      post red_cards_url, params: { red_card: { game_id: @red_card.game_id, player_id: @red_card.player_id, time: @red_card.time } }
    end

    assert_redirected_to red_card_url(RedCard.last)
  end

  test "should show red_card" do
    get red_card_url(@red_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_red_card_url(@red_card)
    assert_response :success
  end

  test "should update red_card" do
    patch red_card_url(@red_card), params: { red_card: { game_id: @red_card.game_id, player_id: @red_card.player_id, time: @red_card.time } }
    assert_redirected_to red_card_url(@red_card)
  end

  test "should destroy red_card" do
    assert_difference('RedCard.count', -1) do
      delete red_card_url(@red_card)
    end

    assert_redirected_to red_cards_url
  end
end
