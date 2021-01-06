require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get page_new_url
    assert_response :success
  end

end
