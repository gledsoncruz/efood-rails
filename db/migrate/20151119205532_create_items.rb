class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	  t.belongs_to :restaurant, index: true
    	  t.belongs_to :category, index: true
      	t.string :description
      	t.decimal :price
      	t.boolean :available
      	t.decimal :discount

      	t.timestamps null: false
    end
        add_foreign_key :items, :categories
        add_foreign_key :items, :restaurants
  end
end
