class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.string :name
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
