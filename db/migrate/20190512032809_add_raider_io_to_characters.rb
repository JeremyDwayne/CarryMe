class AddRaiderIoToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :raider_io, :float, default: 0
  end
end
