class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false, :unique => true
      t.string :login, :null => false, :unique => true
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false, :unique => true
      t.integer :login_count, :default => 0, :null => false

      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
    end

    add_index :users, :last_request_at
  end

  def self.down
    drop_table :users
  end
end
