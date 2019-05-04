class RenameTypeFieldOnCarries < ActiveRecord::Migration[5.2]
  def change
    rename_column :carries, :type, :carry_type
  end
end
