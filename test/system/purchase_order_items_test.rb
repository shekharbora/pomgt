require "application_system_test_case"

class PurchaseOrderItemsTest < ApplicationSystemTestCase
  setup do
    @purchase_order_item = purchase_order_items(:one)
  end

  test "visiting the index" do
    visit purchase_order_items_url
    assert_selector "h1", text: "Purchase order items"
  end

  test "should create purchase order item" do
    visit purchase_order_items_url
    click_on "New purchase order item"

    fill_in "Basic price", with: @purchase_order_item.basic_price
    fill_in "Hsn code", with: @purchase_order_item.hsn_code
    fill_in "Item desctiption", with: @purchase_order_item.item_desctiption
    fill_in "Qty", with: @purchase_order_item.qty
    fill_in "Total amount", with: @purchase_order_item.total_amount
    fill_in "Unit", with: @purchase_order_item.unit
    click_on "Create Purchase order item"

    assert_text "Purchase order item was successfully created"
    click_on "Back"
  end

  test "should update Purchase order item" do
    visit purchase_order_item_url(@purchase_order_item)
    click_on "Edit this purchase order item", match: :first

    fill_in "Basic price", with: @purchase_order_item.basic_price
    fill_in "Hsn code", with: @purchase_order_item.hsn_code
    fill_in "Item desctiption", with: @purchase_order_item.item_desctiption
    fill_in "Qty", with: @purchase_order_item.qty
    fill_in "Total amount", with: @purchase_order_item.total_amount
    fill_in "Unit", with: @purchase_order_item.unit
    click_on "Update Purchase order item"

    assert_text "Purchase order item was successfully updated"
    click_on "Back"
  end

  test "should destroy Purchase order item" do
    visit purchase_order_item_url(@purchase_order_item)
    click_on "Destroy this purchase order item", match: :first

    assert_text "Purchase order item was successfully destroyed"
  end
end
