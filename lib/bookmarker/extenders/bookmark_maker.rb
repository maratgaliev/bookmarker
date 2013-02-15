module Bookmarker
  module Extenders

    module BookmarkMaker

      def bookmark_maker?
        false
      end

      def is_bookmark_maker(*args)
        require 'bookmarker/bookmark_maker'
        include Bookmarker::BookmarkMaker

        class_eval do
          def self.bookmark_maker?
            true
          end
        end

      end

    end
  end
end