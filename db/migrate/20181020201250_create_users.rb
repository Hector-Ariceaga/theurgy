class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :clinic
      t.boolean :admin, default: false
      t.string :image

      t.timestamps null: false
    end
  end
end
