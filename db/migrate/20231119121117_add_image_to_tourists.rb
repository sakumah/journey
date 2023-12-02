class AddImageToTourists < ActiveRecord::Migration[6.1]
  def change
    add_column :tourists, :image, :string
  end
end
