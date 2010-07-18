class SimplifyUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :crypted_password, :string, :null => true
      t.change :password_salt, :string, :null => true
      t.change :persistence_token, :string, :null => true
    end
  end

  def self.down
    change_table :users do |t|
      t.change :persistence_token, :string, :null => false
      t.change :password_salt, :string, :null => false
      t.change :crypted_password, :string, :null => false
    end
  end
end
