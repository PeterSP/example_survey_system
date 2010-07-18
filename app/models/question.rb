class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  has_many :responses

  accepts_nested_attributes_for :options
  
  validates_presence_of :options
end
