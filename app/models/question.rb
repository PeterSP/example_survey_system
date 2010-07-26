class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  has_many :responses
  has_many :question_requirements
  has_many :options_required, :through => :question_requirements, \
    :class_name => 'Option', :source => :option

  accepts_nested_attributes_for :options
  
  validates_presence_of :options
end
