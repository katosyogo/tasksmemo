class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :title,            null: false
      t.text :content
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
