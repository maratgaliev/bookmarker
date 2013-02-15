module Bookmarker
  module Extenders

    module Bookmarkable

      def bookmarkable?
        false
      end

      
      def is_bookmarkable
        require 'bookmarker/bookmarkable'
        include Bookmarker::Bookmarkable

        class_eval do
          def self.bookmarkable?
            true
          end
        end

      end

    end

  end
end