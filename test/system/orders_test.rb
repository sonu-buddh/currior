require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Assm state", with: @order.assm_state
    fill_in "Cost of service", with: @order.cost_of_service
    fill_in "Curior number", with: @order.curior_number
    fill_in "Payment mode", with: @order.payment_mode
    fill_in "Receiver address", with: @order.receiver_address
    fill_in "Receiver mobile", with: @order.receiver_mobile
    fill_in "Receiver name", with: @order.receiver_name
    fill_in "Receiver pincode", with: @order.receiver_pincode
    fill_in "Sender address", with: @order.sender_address
    fill_in "Sender mobile", with: @order.sender_mobile
    fill_in "Sender name", with: @order.sender_name
    fill_in "Sender pincode", with: @order.sender_pincode
    fill_in "Type of service", with: @order.type_of_service
    fill_in "Weight", with: @order.weight
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Assm state", with: @order.assm_state
    fill_in "Cost of service", with: @order.cost_of_service
    fill_in "Curior number", with: @order.curior_number
    fill_in "Payment mode", with: @order.payment_mode
    fill_in "Receiver address", with: @order.receiver_address
    fill_in "Receiver mobile", with: @order.receiver_mobile
    fill_in "Receiver name", with: @order.receiver_name
    fill_in "Receiver pincode", with: @order.receiver_pincode
    fill_in "Sender address", with: @order.sender_address
    fill_in "Sender mobile", with: @order.sender_mobile
    fill_in "Sender name", with: @order.sender_name
    fill_in "Sender pincode", with: @order.sender_pincode
    fill_in "Type of service", with: @order.type_of_service
    fill_in "Weight", with: @order.weight
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
