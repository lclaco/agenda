require "test_helper"

class FootersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get footers_index_url
    assert_response :success
  end
end
