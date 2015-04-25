class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :company, index: true, foreign_key: true
      t.string :email
      t.string :password

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
