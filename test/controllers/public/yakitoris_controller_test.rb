require "test_helper"

class Public::YakitorisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_yakitoris_index_url
    assert_response :success
  end

  test "should get show" do
    get public_yakitoris_show_url
    assert_response :success
  end
end
