class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question, :null => false
      t.string :help
      t.string :type, :null => false

      t.references :survey, :null => false

      t.timestamps
    end
    add_index :questions, :survey_id
  end

  def self.down
    drop_table :questions
  end
end
