require 'test_helper'

class LineItemDatesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get line_item_dates_new_url
    assert_response :success
  end

  test 'should get create' do
    get line_item_dates_create_url
    assert_response :success
  end
end
