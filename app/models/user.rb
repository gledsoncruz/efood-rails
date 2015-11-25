class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable

    has_many :orders, dependent: :destroy
    has_many :restaurants, dependent: :destroy
    has_many :employees, class_name: "User"
    belongs_to :manager, class_name: "User"
    belongs_to :plan

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "60x60#" }, default_url: ActionController::Base.helpers.asset_path('logo.jpg')
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    validates :name, :cpf, :cel, presence: true
    validates_cpf :cpf

end
