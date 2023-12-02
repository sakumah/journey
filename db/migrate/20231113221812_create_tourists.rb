class CreateTourists < ActiveRecord::Migration[6.1]
  def change
    create_table :tourists do |t|
      t.string :name
      t.string :what
      t.text :how
      t.text :more
      t.text :access

      t.timestamps
    end
  end
end
