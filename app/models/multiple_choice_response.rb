class MultipleChoiceResponse < Response
  belongs_to :option, :counter_cache => true

  validate :question_scope

  def question_scope
    errors.add_to_base("Option must match Question") unless option.question_id == question_id
  end
end
