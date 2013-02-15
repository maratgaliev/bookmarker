require 'active_record'
require 'active_support/inflector'


$LOAD_PATH.unshift(File.dirname(__FILE__))

module Bookmarker
  if defined?(ActiveRecord::Base)
  	require "bookmarker/engine"
	require "bookmarker/version"
	require "bookmarker/engine"
    require 'bookmarker/extenders/bookmarkable'
    require 'bookmarker/extenders/bookmark_maker'
    require 'bookmarker/bookmark'
    ActiveRecord::Base.extend Bookmarker::Extenders::Bookmarkable
    ActiveRecord::Base.extend Bookmarker::Extenders::BookmarkMaker
  end
end
