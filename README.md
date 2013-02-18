bookmarker
=======================

Add bookmarks to your models.

* Add gem "bookmarker" to your Gemfile

* Run generator: rails g bookmarker:install and rake db:migrate

* Add is_bookmarkable to your bookmarkable model (for example Company)

* Add is_bookmark_maker to your bookmark maker model (for example User)

* Use @user.add_bookmark(@company, 'My bookmark description') or @user.unbookmark @company

* Use @user.bookmarks for list of added bookmarks

* Available methods: remove_bookmarks - delete all model bookmarks, find_bookmarks(Your class here, for ex. Company) - find bookmarks linked with specific class, has_in_bookmarks?(bookmarkable_instance)
