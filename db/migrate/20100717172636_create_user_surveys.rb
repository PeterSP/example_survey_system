class CreateUserSurveys < ActiveRecord::Migration
  def self.up
    create_table :user_surveys do |t|
      t.references :user, :null => false
      t.references :survey, :null => false

      t.timestamps
    end

    add_index :user_surveys, [:user_id, :survey_id], :unique => true, :name => :index_users_surveys
  end

  def self.down
    drop_table :user_surveys
  end
end
