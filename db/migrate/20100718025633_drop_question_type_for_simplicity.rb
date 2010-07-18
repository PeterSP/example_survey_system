class DropQuestionTypeForSimplicity < ActiveRecord::Migration
  def self.up
    remove_column :questions, :type
  end

  def self.down
    add_column :questions, :type, :string, :null => false
  end
end
