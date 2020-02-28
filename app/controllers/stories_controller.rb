class StoriesController < ApplicationController
  def index
    stories = list_top_stories
    render json: stories
  end

  private

  def list_top_stories
    default_amount = 15
    ListTopStories.new(default_amount).execute
  end
end
