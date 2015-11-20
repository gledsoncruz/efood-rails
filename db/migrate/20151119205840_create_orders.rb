class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :item, index: true
      	t.integer :amount
      	t.datetime :order_date

      	t.timestamps null: false
    end
    	add_foreign_key :orders, :users
    	add_foreign_key :orders, :items
  end
end
