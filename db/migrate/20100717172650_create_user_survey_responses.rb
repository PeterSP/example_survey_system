class CreateUserSurveyResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.references :user_survey
      t.references :question

      t.references :option

      t.datetime :created_at
    end
  end

  def self.down
    drop_table :responses
  end
end
