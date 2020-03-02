class CommentsController < ApplicationController
  def index
    comments = list_story_comments(comments_params[:story_id])
    render json: comments
  end

  private

  def comments_params
    params.permit(:story_id)
  end

  def list_story_comments(story_id)
    ListStoryComments.new(story_id).execute.map do |comment|
      CommentPresenter.new(comment)
    end
  end
end
