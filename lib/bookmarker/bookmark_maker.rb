module Bookmarker
  module BookmarkMaker

    def self.included(base)

      aliases = {
        :add_bookmark => [:new_bookmark],
        :unbookmark => [:remove_bookmark]
      }

      base.class_eval do

        belongs_to :bookmark_maker, :polymorphic => true

        validates_uniqueness_of :bookmark

        has_many :bookmarks, :class_name => "Bookmarker::Bookmark", :as => :bookmark_maker

        aliases.each do |method, links|
          links.each do |new_method|
            alias_method(new_method, method)
          end
        end
      end
    end

    def add_bookmark bookmarkable, description = nil
      bookmark = Bookmarker::Bookmark.new( :bookmarkable => bookmarkable, :bookmark_maker => self, :description => description)
      bookmark.save ? true : false
    end

    def find_bookmarks bookmarkable_model
      bookmarks.where(:bookmarkable_type => bookmarkable_model.base_class.name)
    end

    def remove_bookmarks
      bookmarks.delete_all
    end

    def unbookmark bookmarkable
      bookmark = self.bookmarks.where(:bookmarkable_id => bookmarkable.id, :bookmarkable_type => bookmarkable.class.name).first        
      bookmark.destroy ? true : false
    end

  end
end