require "test_helper"

class PalindromsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get palindroms_index_url
    assert_response :success
  end

  test "should get result" do
    get palindroms_result_url
    assert_response :success
  end
end
