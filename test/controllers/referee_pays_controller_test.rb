require "test_helper"

class RefereePaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referee_pay = referee_pays(:one)
  end

  test "should get index" do
    get referee_pays_url
    assert_response :success
  end

  test "should get new" do
    get new_referee_pay_url
    assert_response :success
  end

  test "should create referee_pay" do
    assert_difference('RefereePay.count') do
      post referee_pays_url, params: { referee_pay: { amount: @referee_pay.amount, level_id: @referee_pay.level_id, position_id: @referee_pay.position_id } }
    end

    assert_redirected_to referee_pay_url(RefereePay.last)
  end

  test "should show referee_pay" do
    get referee_pay_url(@referee_pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_referee_pay_url(@referee_pay)
    assert_response :success
  end

  test "should update referee_pay" do
    patch referee_pay_url(@referee_pay), params: { referee_pay: { amount: @referee_pay.amount, level_id: @referee_pay.level_id, position_id: @referee_pay.position_id } }
    assert_redirected_to referee_pay_url(@referee_pay)
  end

  test "should destroy referee_pay" do
    assert_difference('RefereePay.count', -1) do
      delete referee_pay_url(@referee_pay)
    end

    assert_redirected_to referee_pays_url
  end
end
