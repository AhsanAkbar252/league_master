require "test_helper"

class RefereeLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referee_level = referee_levels(:one)
  end

  test "should get index" do
    get referee_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_referee_level_url
    assert_response :success
  end

  test "should create referee_level" do
    assert_difference('RefereeLevel.count') do
      post referee_levels_url, params: { referee_level: { name: @referee_level.name } }
    end

    assert_redirected_to referee_level_url(RefereeLevel.last)
  end

  test "should show referee_level" do
    get referee_level_url(@referee_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_referee_level_url(@referee_level)
    assert_response :success
  end

  test "should update referee_level" do
    patch referee_level_url(@referee_level), params: { referee_level: { name: @referee_level.name } }
    assert_redirected_to referee_level_url(@referee_level)
  end

  test "should destroy referee_level" do
    assert_difference('RefereeLevel.count', -1) do
      delete referee_level_url(@referee_level)
    end

    assert_redirected_to referee_levels_url
  end
end
