class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
