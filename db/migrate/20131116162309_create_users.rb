class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :forename
      t.string :family_name
      t.string :email
      t.string :password
      t.datetime :created_at
      t.string :role
      t.string :status

      t.timestamps
    end
  end
end
