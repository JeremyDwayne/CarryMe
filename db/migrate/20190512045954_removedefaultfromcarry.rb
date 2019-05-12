class Removedefaultfromcarry < ActiveRecord::Migration[5.2]
  def change
    change_column_default :carries, :carry_type, nil
  end
end
