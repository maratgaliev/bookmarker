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

        has_many :bookmarks, :class_name => "Bookmarker::Bookmark", :as => :bookmark_maker do
          def bookmarkables
            includes(:bookmarkable).map(&:bookmarkable)
          end
        end

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
        return true
      else
        return false
      end

    end

    def find_bookmarks extra_conditions = {}
      bookmarks.where(extra_conditions)
    end

    def unbookmark bookmarkable
      return false if bookmarkable.nil?
        bookmark = self.bookmarks.where(:bookmarkable_id => bookmarkable.id, :bookmarkable_type => bookmarkable.class.name.to_s)
        puts bookmark
        #bookmark.destroy
      return true
    end


  end
end