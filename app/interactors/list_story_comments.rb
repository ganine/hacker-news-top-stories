class ListStoryComments

  def initialize(
    story_id,
    hacker_news_api = HackerNewsAPI.new,
    comments_repository = CommentsRepository.new
  )
    @story_id = story_id
    @hacker_news_api = hacker_news_api
    @comments_repository = comments_repository
  end

  def execute
    story = @hacker_news_api.story(@story_id)

    story['kids'].each.map do |comment_id|
      comment = @comments_repository.find_by_item_id(comment_id)

      unless comment.present?
        result = @hacker_news_api.comment(comment_id)
        comment = build_model(result)
        @comments_repository.add(comment)
      end

      comment
    end.select(&:relevant?)
  end

  private

  def build_model(result)
    attributes = {
      item_id: result['id'],
      author: result['by'],
      story_id: result['parent'],
      content: result['text'],
      published_at: Time.at(result['time'])
    }
    Comment.new(attributes)
  end

  def build_model_list(results)
    results.map { |result| build_model(result) }
  end
end
