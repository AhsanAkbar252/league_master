require "test_helper"

class RefereePositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referee_position = referee_positions(:one)
  end

  test "should get index" do
    get referee_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_referee_position_url
    assert_response :success
  end

  test "should create referee_position" do
    assert_difference('RefereePosition.count') do
      post referee_positions_url, params: { referee_position: { name: @referee_position.name } }
    end

    assert_redirected_to referee_position_url(RefereePosition.last)
  end

  test "should show referee_position" do
    get referee_position_url(@referee_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_referee_position_url(@referee_position)
    assert_response :success
  end

  test "should update referee_position" do
    patch referee_position_url(@referee_position), params: { referee_position: { name: @referee_position.name } }
    assert_redirected_to referee_position_url(@referee_position)
  end

  test "should destroy referee_position" do
    assert_difference('RefereePosition.count', -1) do
      delete referee_position_url(@referee_position)
    end

    assert_redirected_to referee_positions_url
  end
end
