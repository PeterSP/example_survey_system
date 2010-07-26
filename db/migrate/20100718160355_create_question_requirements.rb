class CreateQuestionRequirements < ActiveRecord::Migration
  def self.up
    create_table :question_requirements do |t|
      t.references :question
      t.references :option

      t.timestamps
    end
    add_index :question_requirements, [:question_id, :option_id], :unique => true
  end

  def self.down
    drop_table :question_requirements
  end
end
