class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :password , :email , presence: true
  has_one  :profile, dependent: :destroy
  has_one  :address, dependent: :destroy
  has_many :items
end
