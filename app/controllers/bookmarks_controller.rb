class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])   
    @bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.save
    redirect_to @topic
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  
    @bookmark.update_attributes(bookmark_params)
    redirect_to @topic
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    
    @bookmark.destroy
    redirect_to @topic
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
