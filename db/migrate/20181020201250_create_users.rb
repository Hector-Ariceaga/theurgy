class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :clinic
      t.boolean :admin, default: false
      t.string :email
      t.string :image
      t.string :uid

      t.timestamps null: false
    end
  end
end
