require "test_helper"

class OnsensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get onsens_index_url
    assert_response :success
  end
end
