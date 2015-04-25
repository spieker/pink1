class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.references :user, index: true, foreign_key: true
      t.string :source

      t.timestamps null: false
    end
    add_index :aliases, :source, unique: true
  end
end
