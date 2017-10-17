class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, foreign_key: true
      t.boolean :host

      t.timestamps
    end
  end
end
