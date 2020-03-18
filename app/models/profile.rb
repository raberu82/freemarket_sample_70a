class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day, presence: true
end
