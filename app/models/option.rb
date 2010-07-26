class Option < ActiveRecord::Base
  validates_presence_of :value
  belongs_to :question
  has_one :survey, :through => :question
  has_many :responses

  has_many :question_requirements
  has_many :questions_requiring, :through => :question_requirements, :class_name => 'Question', :source => :question
end
