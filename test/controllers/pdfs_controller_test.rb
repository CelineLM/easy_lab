require 'test_helper'

class PdfsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pdfs_create_url
    assert_response :success
  end

end
