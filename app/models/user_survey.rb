class UserSurvey < ActiveRecord::Base
  has_many :responses
  belongs_to :survey, :counter_cache => true
  belongs_to :user
  
  accepts_nested_attributes_for :responses

  validates_uniqueness_of :user_id, :scope => :survey_id
end
