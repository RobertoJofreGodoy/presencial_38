require 'test_helper'

class CompletadosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get completados_create_url
    assert_response :success
  end

end
