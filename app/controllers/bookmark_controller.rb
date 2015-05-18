class BookmarkController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @topics = Topic.all
  end
end
