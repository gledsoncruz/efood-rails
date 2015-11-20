class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

    has_many :orders, dependent: :destroy
    has_many :restaurants, dependent: :destroy
    has_many :employees, class_name: "User"
    belongs_to :manager, class_name: "User"
    
end
