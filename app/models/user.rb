class User < ActiveRecord::Base
  has_many :user_surveys
  has_many :responses, :through => :user_surveys
  has_many :owned_surveys, :foreign_key => :owner_id, :class_name => 'Survey'
end
