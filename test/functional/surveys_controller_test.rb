require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post :create, :survey => { :name => 'New Survey', :owner_id => User.first.id }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should show survey" do
    get :show, :id => surveys(:gender).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => surveys(:gender).to_param
    assert_response :success
  end

  test "should update survey" do
    put :update, :id => surveys(:gender).to_param, :survey => { :name => 'Sex Survey', :owner_id => users(:alice).id }
    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete :destroy, :id => surveys(:gender).to_param
    end

    assert_redirected_to surveys_path
  end
end
