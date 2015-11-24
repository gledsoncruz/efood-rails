class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :description
      t.decimal :price
      t.integer :max_restaurants
      t.integer :max_employees
      t.integer :max_items
      t.string :periodicity # monthly, yearly
      t.decimal :discount
      t.boolean :renew, default: false
      t.datetime :date_signature

      t.timestamps null: false
    end
  end
end
