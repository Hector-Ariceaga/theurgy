class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.string :details

      t.timestamps null: false
    end
  end
end
