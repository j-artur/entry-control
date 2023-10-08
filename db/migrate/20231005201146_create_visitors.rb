class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :cpf
      t.string :name
      t.string :rg
      t.string :phone

      t.timestamps
    end
  end
end
