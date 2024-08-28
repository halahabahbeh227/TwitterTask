class TweetsController < ApplicationController
    def index
      @tweets = Tweet.order(created_at: :asc)
    end
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      @tweet = Tweet.new(tweet_params)
      if @tweet.save
        redirect_to tweets_path, notice: 'Tweet was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def tweet_params
      params.require(:tweet).permit(:content)
    end
  end
  
