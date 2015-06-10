class LikesController < ApplicationController
 def create
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.build(bookmark: @bookmark)
   authorize like

   if like.save
       # Add code to generate a success flash and redirect to @bookmark
       redirect_to :back, notice:"Liked."
     else
       # Add code to generate a failure flash and redirect to @bookmark
       redirect_to :back, notice: "Failed to Like this bookmark"
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.find(params[:id])
     authorize like
     
     if like.destroy
       # Flash success and redirect to @bookmark
       redirect_to :back, notice: "Unliked"
     else
       # Flash error and redirect to @bookmark
       redirect_to :back, notice: "Failed to unlike this bookmark"
     end
   end
 end
