class UserSurvey < ActiveRecord::Base
  has_many :responses, :order => :question_id
  belongs_to :survey, :counter_cache => true
  belongs_to :user
  
  accepts_nested_attributes_for :responses

end
