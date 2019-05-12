class ChangeCarryTypeToEnum < ActiveRecord::Migration[5.2]
  def change
    remove_column :carries, :carry_type
    add_column :carries, :carry_type, :integer, default: 0
  end
end
