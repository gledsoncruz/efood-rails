class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.belongs_to :user, index: true
      t.string :name
      t.string :cnpj

      t.timestamps null: false
    end
    add_foreign_key :restaurants, :users
  end
end
