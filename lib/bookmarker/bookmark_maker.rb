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

    def add_bookmark bookmarkable

      bookmark = Bookmarker::Bookmark.new( :bookmarkable => bookmarkable, :bookmark_maker => self)

      if bookmark.save
        true
      else
        false
      end

    end

    def find_bookmarks bookmarkable_model
      bookmarks.where(:bookmarkable_type => bookmarkable_model.base_class.name.to_s)
    end

    def remove_bookmarks
      bookmarks.delete_all
    end

    def unbookmark bookmarkable
      bookmark = self.bookmarks.where(:bookmarkable_id => bookmarkable.id, :bookmarkable_type => bookmarkable.class.name.to_s).first        
      if bookmark.destroy
        true
      else
        false
      end     
    end


  end
end