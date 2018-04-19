require 'test_helper'

class EnquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get enquiry_name:string_url
    assert_response :success
  end

  test "should get phone:string" do
    get enquiry_phone:string_url
    assert_response :success
  end

  test "should get purpose:string" do
    get enquiry_purpose:string_url
    assert_response :success
  end

  test "should get locality:string" do
    get enquiry_locality:string_url
    assert_response :success
  end

end
