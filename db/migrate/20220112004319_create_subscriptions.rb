class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.text :title
      t.float :price
      t.integer :status
      t.integer :frequency
      t.integer :quantity
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true

      t.timestamps
    end
  end
end
