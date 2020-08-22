require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shippings_index_url
    assert_response :success
  end

  test "should get edit" do
    get shippings_edit_url
    assert_response :success
  end

end
