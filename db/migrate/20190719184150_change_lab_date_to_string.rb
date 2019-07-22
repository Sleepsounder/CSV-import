class ChangeLabDateToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :lab_date, :string
  end
end
