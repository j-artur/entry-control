class SetUserNullableOnVisits < ActiveRecord::Migration[7.0]
  def change
    change_column_null :visits, :user_id, true
  end
end
