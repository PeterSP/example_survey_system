require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "assoc questions" do
    assert surveys(:gender).questions[0].is_a? Question
  end
  test "assoc options" do
    assert surveys(:gender).options[0].is_a? Option
  end
  test "assoc user surveys" do
    assert surveys(:gender).user_surveys[0].is_a? UserSurvey
  end
  test "assoc responses" do
    assert surveys(:gender).responses[0].is_a? Response
  end
  test "assoc owner" do
    assert surveys(:gender).owner.is_a? User
  end
end
