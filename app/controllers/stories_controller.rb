class StoriesController < ApplicationController

  def index
    stories = list_top_stories
    render json: stories
  end

  def search
    stories = search_stories(params[:term])
    render json: stories
  end

  private

  def search_params
    params.permit(:term)
  end

  def list_top_stories
    ListTopStories.new.execute.map do |story|
      StoryPresenter.new(story)
    end
  end

  def search_stories(term)
    SearchStories.new(term).execute.map do |result|
      StoryPresenter.new(result)
    end
  end
end
