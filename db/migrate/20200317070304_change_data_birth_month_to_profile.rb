class ChangeDataBirthMonthToProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :birth_month, :string
  end
end
