class CreateTransacts < ActiveRecord::Migration[7.0]
  def change
    create_table :transacts do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
