class ListStoryComments
  def initialize(
    story_id,
    hacker_news_api = HackerNewsAPI.new,
    comments_repository = CommentsRepository.new,
    stories_repository = StoriesRepository.new
  )
    @story_id = story_id
    @hacker_news_api = hacker_news_api
    @comments_repository = comments_repository
    @stories_repository = stories_repository
  end

  def execute
    story_result = @hacker_news_api.story(@story_id)
    update_story_comments_count(story_result)

    fetch_story_comments(story_result)
  end

  private

  def fetch_story_comments(story_result)
    story_result['kids'].each.map do |comment_id|
      comment = @comments_repository.find_by_item_id(comment_id)

      unless comment.present?
        result = @hacker_news_api.comment(comment_id)
        comment = build_comment(result)
        @comments_repository.add(comment)
      end

      comment
    end.select(&:relevant?)
  end

  def build_comment(result)
    Comment.new(
      item_id: result['id'],
      author: result['by'],
      story_id: result['parent'],
      content: result['text'],
      published_at: Time.at(result['time'])
    )
  end

  def update_story_comments_count(result)
    story = Story.new(
      item_id: result['id'],
      comments_count: result['kids'].size
    )

    @stories_repository.put(story)
  end
end
