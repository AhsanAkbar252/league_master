require "test_helper"

class YellowCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yellow_card = yellow_cards(:one)
  end

  test "should get index" do
    get yellow_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_yellow_card_url
    assert_response :success
  end

  test "should create yellow_card" do
    assert_difference('YellowCard.count') do
      post yellow_cards_url, params: { yellow_card: { game_id: @yellow_card.game_id, player_id: @yellow_card.player_id, time: @yellow_card.time } }
    end

    assert_redirected_to yellow_card_url(YellowCard.last)
  end

  test "should show yellow_card" do
    get yellow_card_url(@yellow_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_yellow_card_url(@yellow_card)
    assert_response :success
  end

  test "should update yellow_card" do
    patch yellow_card_url(@yellow_card), params: { yellow_card: { game_id: @yellow_card.game_id, player_id: @yellow_card.player_id, time: @yellow_card.time } }
    assert_redirected_to yellow_card_url(@yellow_card)
  end

  test "should destroy yellow_card" do
    assert_difference('YellowCard.count', -1) do
      delete yellow_card_url(@yellow_card)
    end

    assert_redirected_to yellow_cards_url
  end
end
