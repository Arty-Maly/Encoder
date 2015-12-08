class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :m_message
      t.integer :m_offset
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
