class AddSectorToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :sector, null: false, foreign_key: true
  end
end
