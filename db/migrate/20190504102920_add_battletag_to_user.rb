class AddBattletagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :battletag, :string
  end
end
