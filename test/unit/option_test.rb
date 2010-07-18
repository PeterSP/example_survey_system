require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  test "assoc question" do
    assert options(:bi).question.is_a? Question
  end

  test "assoc survey" do
    assert options(:bi).survey.is_a? Survey
  end

  test "assoc responses" do
    assert options(:straight).responses[0].is_a? Response
  end
end
