class Anonymity < ActiveRecord::Migration
  def self.up
    change_table :user_surveys do |t|
      t.change :user_id, :integer, :null => true
    end
  end

  def self.down
    remove_index :index_users_surveys
    change_table :user_surveys do |t|
      t.change :survey_id, :integer, :null => false
    end
  end
end
