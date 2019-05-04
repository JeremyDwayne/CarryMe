require 'test_helper'

class CarriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carry = carries(:one)
  end

  test "should get index" do
    get carries_url
    assert_response :success
  end

  test "should get new" do
    get new_carry_url
    assert_response :success
  end

  test "should create carry" do
    assert_difference('Carry.count') do
      post carries_url, params: { carry: { description: @carry.description, price: @carry.price, title: @carry.title, type: @carry.type, user_id: @carry.user_id } }
    end

    assert_redirected_to carry_url(Carry.last)
  end

  test "should show carry" do
    get carry_url(@carry)
    assert_response :success
  end

  test "should get edit" do
    get edit_carry_url(@carry)
    assert_response :success
  end

  test "should update carry" do
    patch carry_url(@carry), params: { carry: { description: @carry.description, price: @carry.price, title: @carry.title, type: @carry.type, user_id: @carry.user_id } }
    assert_redirected_to carry_url(@carry)
  end

  test "should destroy carry" do
    assert_difference('Carry.count', -1) do
      delete carry_url(@carry)
    end

    assert_redirected_to carries_url
  end
end
