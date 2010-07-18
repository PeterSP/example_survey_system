require 'test_helper'

class SurveyQuestionOptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_question_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_question_option" do
    assert_difference('SurveyQuestionOption.count') do
      post :create, :survey_question_option => { }
    end

    assert_redirected_to survey_question_option_path(assigns(:survey_question_option))
  end

  test "should show survey_question_option" do
    get :show, :id => survey_question_options(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => survey_question_options(:one).to_param
    assert_response :success
  end

  test "should update survey_question_option" do
    put :update, :id => survey_question_options(:one).to_param, :survey_question_option => { }
    assert_redirected_to survey_question_option_path(assigns(:survey_question_option))
  end

  test "should destroy survey_question_option" do
    assert_difference('SurveyQuestionOption.count', -1) do
      delete :destroy, :id => survey_question_options(:one).to_param
    end

    assert_redirected_to survey_question_options_path
  end
end
