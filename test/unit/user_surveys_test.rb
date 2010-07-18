require 'test_helper'

class UserSurveysTest < ActiveSupport::TestCase
  test "assoc responses" do
    assert user_surveys(:bob).responses[0].is_a? Response
  end
  test "assoc survey" do
    assert user_surveys(:bob).survey.is_a? Survey
  end
  test "assoc user" do
    assert user_surveys(:bob).user.is_a? User
  end
end
