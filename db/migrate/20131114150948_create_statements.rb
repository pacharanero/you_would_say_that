class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.datetime :start_time
      t.string :statement_metadata
      t.text :statement_body
      t.datetime :end_time
      t.string :statement_digest

      t.timestamps
    end
  end
end
