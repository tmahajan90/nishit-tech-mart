require 'test_helper'

class ItemDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_detail = item_details(:one)
  end

  test "should get index" do
    get item_details_url
    assert_response :success
  end

  test "should get new" do
    get new_item_detail_url
    assert_response :success
  end

  test "should create item_detail" do
    assert_difference('ItemDetail.count') do
      post item_details_url, params: { item_detail: { chassie_no: @item_detail.chassie_no } }
    end

    assert_redirected_to item_detail_url(ItemDetail.last)
  end

  test "should show item_detail" do
    get item_detail_url(@item_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_detail_url(@item_detail)
    assert_response :success
  end

  test "should update item_detail" do
    patch item_detail_url(@item_detail), params: { item_detail: { chassie_no: @item_detail.chassie_no } }
    assert_redirected_to item_detail_url(@item_detail)
  end

  test "should destroy item_detail" do
    assert_difference('ItemDetail.count', -1) do
      delete item_detail_url(@item_detail)
    end

    assert_redirected_to item_details_url
  end
end
