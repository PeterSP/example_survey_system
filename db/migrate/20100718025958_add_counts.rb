class AddCounts < ActiveRecord::Migration
  def self.up
    add_column :surveys, :user_surveys_count, :integer, :null => false, :default => 0
    add_column :options, :responses_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :options, :user_surveys_count
    remove_column :surveys, :responses_count
  end
end
