module Bookmarker
  class Bookmark < ::ActiveRecord::Base

    # attr_accessible :bookmarkable_id, :bookmarkable_type,
    #   :bookmark_maker_id, :bookmark_maker_type,
    #   :bookmarkable, :bookmark_maker, :description

    belongs_to :bookmarkable, :polymorphic => true
    belongs_to :bookmark_maker, :polymorphic => true

    validates_presence_of :bookmarkable_id
    validates_presence_of :bookmark_maker_id

    validates_uniqueness_of :bookmarkable_id, :scope => [:bookmarkable_type, :bookmark_maker_id, :bookmarkable_type]

  end

end