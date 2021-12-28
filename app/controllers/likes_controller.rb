class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @tweet.increment! :likes_count
    redirect_to @tweet # returns show _tweet which contains a turbo_frame_tag, allowing this to be called in a turbo frame tag
  end

  private

  def set_tweet
    @tweet = Tweet.find params[:tweet_id]
  end
end
