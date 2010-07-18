class CreateSurveyQuestionOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.references :question
      t.string :value

      t.timestamps
    end
    add_index :options, :question_id
  end

  def self.down
    drop_table :options
  end
end
