class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :author
      t.timestamp :published_at
      t.string :url
      t.integer :item_id

      t.timestamps
    end
  end
end
