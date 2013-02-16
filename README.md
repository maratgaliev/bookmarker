bookmarker
==========

Add bookmarks to your models.

1) Add gem "bookmarker" to your Gemfile

2) Run generator: rails g bookmaker:install and rake db:migrate

3) Add is_bookmarkable to your bookmarkable model (for example Company)

4) Add is_bookmark_maker to your bookmark maker model (for example User)

5) Use @user.add_bookmark(@company, 'My bookmark description') or @user.unbookmark @company

6) Use @user.bookmarks for list of added bookmarks

7) Available methods: remove_bookmarks - delete all model bookmarks, find_bookmarks(Your class here, for ex. Company) - find bookmarks linked with specific class.
