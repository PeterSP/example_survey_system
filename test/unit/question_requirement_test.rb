require 'test_helper'

class QuestionRequirementTest < ActiveSupport::TestCase
  test "assoc question" do
    assert question_requirements(:one).question.is_a? Question
  end
  test "assoc option" do
    assert question_requirements(:one).option.is_a? Option
  end
end
