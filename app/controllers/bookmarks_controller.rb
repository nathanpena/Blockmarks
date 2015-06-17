class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])  
    @bookmark_total = @topic.bookmarks.count 
    @bookmark = @topic.bookmarks.find_or_create_by(bookmark_params)
    @bookmark.update_attributes(user_id: current_user.id)
    authorize @bookmark
    if @bookmark_total == @topic.bookmarks.count
      flash[:notice] = "You already have this Bookmark."
      redirect_to @topic
    else
      flash[:notice] = "Bookmark was created." 
      redirect_to @topic
    end
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
