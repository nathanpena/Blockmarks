class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    Rails.logger.info "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 
    
    # Find the user by using params[:sender]
    @user = User.find(params[:sender])

     # Find the topic by using params[:subject]
     @topic = Topic.find(params[:subject])

     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = params[:"body-plain"]

     # Check if user is nil, if so, create and save a new user
     if @user.nil?
        @user = User.create(:username => params[:from].slice(0..((:from.index('<')-2))), :email => params[:sender])
        @user.save
     end
       

     # Check if the topic is nil, if so, create and save a new topic
     if @topic.nil?
        @topic = Topic.create(:title => "Generic", :user_id => @user.id)
     end

     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     @bookmark = Bookmark.create(:url => @url, :topic => @topic.id)
     @bookmark.save

    # Assuming all went well. 
    head 200
  end

end
