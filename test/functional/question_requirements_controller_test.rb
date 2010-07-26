require 'test_helper'

class QuestionRequirementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_requirement" do
    assert_difference('QuestionRequirement.count') do
      post :create, :question_requirement => { }
    end

    assert_redirected_to question_requirement_path(assigns(:question_requirement))
  end

  test "should show question_requirement" do
    get :show, :id => question_requirements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => question_requirements(:one).to_param
    assert_response :success
  end

  test "should update question_requirement" do
    put :update, :id => question_requirements(:one).to_param, :question_requirement => { }
    assert_redirected_to question_requirement_path(assigns(:question_requirement))
  end

  test "should destroy question_requirement" do
    assert_difference('QuestionRequirement.count', -1) do
      delete :destroy, :id => question_requirements(:one).to_param
    end

    assert_redirected_to question_requirements_path
  end
end
