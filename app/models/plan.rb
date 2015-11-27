class Plan < ActiveRecord::Base
    include ActiveModel::Validations
    has_many :users
    validates :description, :periodicity, :max_restaurants, :max_employees, :max_items, :discount, presence: true
    validates_numericality_of :price, :discount
    validates_length_of :description, minimum: 3
end
