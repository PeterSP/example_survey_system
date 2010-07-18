require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  test "assoc user survey" do 
    assert responses(:alice_gender).user_survey.is_a? UserSurvey
  end
  test "assoc user" do 
    assert responses(:alice_gender).user.is_a? User
  end
  test "assoc survey" do 
    assert responses(:alice_gender).survey.is_a? Survey
  end
  test "assoc question" do 
    assert responses(:alice_gender).question.is_a? Question
  end
  test "assoc option" do 
    assert responses(:alice_gender).option.is_a? Option
  end
end
