class AddUserIdToMobiles < ActiveRecord::Migration[6.1]
  def change
    add_column :mobiles, :user_id, :integer
    add_index :mobiles, :user_id
  end
end
