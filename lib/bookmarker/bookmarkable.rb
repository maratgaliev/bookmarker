module Bookmarker
  module Bookmarkable

    def self.included(base)
      base.extend ClassMethods
    end

    def self.included base
       base.class_eval do
         belongs_to :bookmarkable, :polymorphic => true
         has_many   :bookmarks, :class_name => "Bookmarker::Bookmark", :as => :bookmarkable
       end
    end

    def default_conditions
       {
         :bookmarkable_id => self.id,
         :bookmarkable_type => self.class.base_class.name.to_s
       }
    end

  end
end