require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get static_page_hello_url
    assert_response :success
  end

end
