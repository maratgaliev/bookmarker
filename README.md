bookmarker
==========

Add bookmarks to your models.

1) Add gem "bookmarker", "~> 0.0.1" to your Gemfile

2) Run generator: rails g bookmaker:install and rake db:migrate

3) Add is_bookmarkable to your bookmarkable model (for example Company)

4) Add is_bookmark_maker to your bookmark maker model (for example User)

5) Use @user.add_bookmark @company or @user.unbookmark @company

6) Use @user.bookmarks for list of added bookmarks
