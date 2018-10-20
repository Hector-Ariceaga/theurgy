class CreateTherapies < ActiveRecord::Migration
  def change
    create_table :therapies do |t|
      t.integer :patient_id
      t.integer :treatment_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
