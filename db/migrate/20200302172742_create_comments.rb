class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.integer :item_id
      t.integer :story_id, null: false, index: true
      # t.references :story, null: false, foreign_key: true
      t.text :content
      t.timestamp :published_at

      t.timestamps
    end
  end
end
