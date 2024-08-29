class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :asc)
    #instance var
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = 'Tweet was successfully created.' 
      redirect_to tweets_path 
    else
      flash.now[:alert] = 'There was an error creating the tweet.' 
      render :new 
    end
  end
 

  private

  def tweet_params
  
    params.require(:tweet).permit(:content)
  end
end