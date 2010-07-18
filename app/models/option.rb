class Option < ActiveRecord::Base
  validates_presence_of :value
  belongs_to :question
  has_one :survey, :through => :question
  has_many :responses
end
