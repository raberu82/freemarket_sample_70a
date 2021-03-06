class Profile < ApplicationRecord
  belongs_to :user, optional: true

  # 全角ひらがなカタカナ漢字
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  # 全角カタカナ
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_year,      presence: true
  validates :birth_month,     presence: true
  validates :birth_day,       presence: true
end
