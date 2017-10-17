class RemoveUserIndexOnMessages < ActiveRecord::Migration[5.1]
  def change
    remove_index(:messages, column: :user_id)
  end
end
