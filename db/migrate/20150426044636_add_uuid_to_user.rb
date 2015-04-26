class AddUuidToUser < ActiveRecord::Migration
  def change
    add_column :users, :uuid, :string, limit: 36
    add_index :users, :uuid, unique: true

    User.all.each do |user|
      user.update_attribute :uuid, SecureRandom.uuid
    end
  end
end
