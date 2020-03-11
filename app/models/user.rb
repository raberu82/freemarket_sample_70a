class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email ,presence: true 
  # belongs_to :delivery
  # has_one :profile
  # accepts_nested_attributes_for :profile
end
