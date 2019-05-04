class CreateCarries < ActiveRecord::Migration[5.2]
  def change
    create_table :carries do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
