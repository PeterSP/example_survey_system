class Survey < ActiveRecord::Base
  has_many :questions
  has_many :user_surveys
  has_many :responses, :through => :user_surveys
  belongs_to :owner, :class_name => 'User'
  
  accepts_nested_attributes_for :questions

  validates_presence_of :name
  validates_presence_of :owner_id
  
end
