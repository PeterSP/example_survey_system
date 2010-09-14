class AddQuestionType < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.string :type, :null => false, :default => 'MultipleChoiceQuestion'
    end
  end

  def self.down
    change_table :questions do |t|
      t.remove :type
    end
  end
end
