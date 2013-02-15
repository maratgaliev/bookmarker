bookmarker
==========

Add bookmarks to your models.

1) Run generator: rails g bookmaker:install and rake db:migrate

2) Add is_bookmarkable to your bookmarkable model (for example Company)

3) Add is_bookmark_maker to your bookmark maker model (for example User)

4) Use @user.add_bookmark @company or @user.unbookmark @company

5) Use @user.bookmarks for list of added bookmarks
