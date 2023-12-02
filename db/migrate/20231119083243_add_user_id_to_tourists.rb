class AddUserIdToTourists < ActiveRecord::Migration[6.1]
  def change
    add_column :tourists, :user_id, :integer
  end
end
