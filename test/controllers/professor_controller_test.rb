require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professors_url, as: :json
    assert_response :success
  end

  test "should get show" do
      profe = users(:professorOne)
      get professors_url(profe), as: :json
      assert_response :success
  end
end
