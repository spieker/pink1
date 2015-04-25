class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
    add_index :domains, :name, unique: true
  end
end
