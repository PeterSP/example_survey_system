class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :user_survey_responses, :through => :user_surveys
end
