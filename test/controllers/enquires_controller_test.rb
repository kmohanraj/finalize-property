require 'test_helper'

class EnquiresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enquires_index_url
    assert_response :success
  end

end
