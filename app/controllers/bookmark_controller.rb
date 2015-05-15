class BookmarkController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
end
