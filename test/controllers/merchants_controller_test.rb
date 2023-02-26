require 'test_helper'

class MerchantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get merchants_url
    assert_response :success
  end

  test "should get new" do
    get new_merchant_url
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post merchants_url, params: { merchant: { disbursement_frequency: @merchant.disbursement_frequency, email_id: @merchant.email_id, live_on: @merchant.live_on, min_monthly_fee: @merchant.min_monthly_fee, name: @merchant.name, status: @merchant.status, total_commission_charged: @merchant.total_commission_charged } }
    end

    assert_redirected_to merchant_url(Merchant.last)
  end

  test "should show merchant" do
    get merchant_url(@merchant)
    assert_response :success
  end

  test "should get edit" do
    get edit_merchant_url(@merchant)
    assert_response :success
  end

  test "should update merchant" do
    patch merchant_url(@merchant), params: { merchant: { disbursement_frequency: @merchant.disbursement_frequency, email_id: @merchant.email_id, live_on: @merchant.live_on, min_monthly_fee: @merchant.min_monthly_fee, name: @merchant.name, status: @merchant.status, total_commission_charged: @merchant.total_commission_charged } }
    assert_redirected_to merchant_url(@merchant)
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete merchant_url(@merchant)
    end

    assert_redirected_to merchants_url
  end
end
