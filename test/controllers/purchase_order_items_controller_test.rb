require "test_helper"

class PurchaseOrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_item = purchase_order_items(:one)
  end

  test "should get index" do
    get purchase_order_items_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_item_url
    assert_response :success
  end

  test "should create purchase_order_item" do
    assert_difference("PurchaseOrderItem.count") do
      post purchase_order_items_url, params: { purchase_order_item: { basic_price: @purchase_order_item.basic_price, hsn_code: @purchase_order_item.hsn_code, item_desctiption: @purchase_order_item.item_desctiption, qty: @purchase_order_item.qty, total_amount: @purchase_order_item.total_amount, unit: @purchase_order_item.unit } }
    end

    assert_redirected_to purchase_order_item_url(PurchaseOrderItem.last)
  end

  test "should show purchase_order_item" do
    get purchase_order_item_url(@purchase_order_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_item_url(@purchase_order_item)
    assert_response :success
  end

  test "should update purchase_order_item" do
    patch purchase_order_item_url(@purchase_order_item), params: { purchase_order_item: { basic_price: @purchase_order_item.basic_price, hsn_code: @purchase_order_item.hsn_code, item_desctiption: @purchase_order_item.item_desctiption, qty: @purchase_order_item.qty, total_amount: @purchase_order_item.total_amount, unit: @purchase_order_item.unit } }
    assert_redirected_to purchase_order_item_url(@purchase_order_item)
  end

  test "should destroy purchase_order_item" do
    assert_difference("PurchaseOrderItem.count", -1) do
      delete purchase_order_item_url(@purchase_order_item)
    end

    assert_redirected_to purchase_order_items_url
  end
end
