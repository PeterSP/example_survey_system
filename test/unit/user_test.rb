require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "assoc user surveys" do
    assert users(:bob).user_surveys[0].is_a? UserSurvey
  end

  test "assoc responses" do
    assert users(:bob).responses[0].is_a? Response
  end

  test "assoc owned surveys" do
    assert users(:bob).owned_surveys[0].is_a? Survey
  end
end
