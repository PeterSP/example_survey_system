class Option < ActiveRecord::Base
  validates_presence_of :value
end
