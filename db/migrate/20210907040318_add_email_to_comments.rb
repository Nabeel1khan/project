class AddEmailToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :email, :string
    add_index :comments, :email
  end
end
