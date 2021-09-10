require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { assm_state: @order.assm_state, cost_of_service: @order.cost_of_service, curior_number: @order.curior_number, payment_mode: @order.payment_mode, receiver_address: @order.receiver_address, receiver_mobile: @order.receiver_mobile, receiver_name: @order.receiver_name, receiver_pincode: @order.receiver_pincode, sender_address: @order.sender_address, sender_mobile: @order.sender_mobile, sender_name: @order.sender_name, sender_pincode: @order.sender_pincode, type_of_service: @order.type_of_service, weight: @order.weight } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { assm_state: @order.assm_state, cost_of_service: @order.cost_of_service, curior_number: @order.curior_number, payment_mode: @order.payment_mode, receiver_address: @order.receiver_address, receiver_mobile: @order.receiver_mobile, receiver_name: @order.receiver_name, receiver_pincode: @order.receiver_pincode, sender_address: @order.sender_address, sender_mobile: @order.sender_mobile, sender_name: @order.sender_name, sender_pincode: @order.sender_pincode, type_of_service: @order.type_of_service, weight: @order.weight } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
