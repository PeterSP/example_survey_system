require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "assoc survey" do
    assert questions(:gender).survey.is_a? Survey
  end
  test "assoc options" do
    assert questions(:gender).options[0].is_a? Option
  end
  test "assoc responses" do
    assert questions(:gender).responses[0].is_a? Response
  end
end
