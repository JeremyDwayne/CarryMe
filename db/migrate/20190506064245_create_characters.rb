class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :realm
      t.string :thumbnail
      t.boolean :main
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
