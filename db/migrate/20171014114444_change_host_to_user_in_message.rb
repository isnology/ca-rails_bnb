class ChangeHostToUserInMessage < ActiveRecord::Migration[5.1]
  def up
    remove_column :messages, :host
    add_reference :messages, :user, foreign_key: true
  end
  
  def down
    remove_column :messages, :user_id
    add_column :messages, :host, :boolean
  end
end
