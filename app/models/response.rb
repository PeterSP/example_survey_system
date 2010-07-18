class Response < ActiveRecord::Base
  belongs_to :user_survey
  has_one :user, :through => :user_survey
  has_one :survey, :through => :user_survey
  belongs_to :question
  belongs_to :option, :counter_cache => true

  validate :question_scope

  def question_scope
    errors.add_to_base("Option must match Question") unless option.question_id == question_id
  end

end
