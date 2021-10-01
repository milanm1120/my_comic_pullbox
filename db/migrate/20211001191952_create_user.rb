class CreateUser < ActiveRecord::Migration[5.2]
  def change
      create_table :users do |t|
        t.string :firstname
        t.string :lastname
        t.string :email
        t.string :username
        t.string :password_digest
      end
  end
end
