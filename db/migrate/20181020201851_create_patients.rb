class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.datetime :dob
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
