class RemoveCharacterDefaultFromCarries < ActiveRecord::Migration[6.0]
  def change
    change_column_default :carries, :character_id, nil
  end
end
