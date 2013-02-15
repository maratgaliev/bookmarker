class CreateBookmarksTable < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.references :bookmarkable, :polymorphic => true
      t.references :bookmark_maker, :polymorphic => true
      t.text :description
      t.timestamps
    end

    add_index :bookmarks, :bookmarkable_type
    add_index :bookmarks, :bookmarkable_id

    add_index :bookmarks, :bookmark_maker_type
    add_index :bookmarks, :bookmark_maker_id

  end

  def self.down
    drop_table :bookmarks
  end
end
