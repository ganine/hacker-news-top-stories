class StoryPresenter
  def initialize(story)
    @story = story
  end

  def as_json(*)
    {
      id: @story.item_id,
      title: @story.title,
      author: {
        user: @story.author,
        url: user_url(@story.author)
      },
      publishedAt: format_datetime(@story.published_at),
      url: @story.url,
      comments: {
        url: comments_url(@story.item_id)
      }
    }
  end

  private

  def format_datetime(datetime)
    datetime.strftime('%m/%d/%Y %H:%M')
  end

  def user_url(username)
    "https://news.ycombinator.com/user?id=#{username}"
  end

  def comments_url(item_id)
    "https://news.ycombinator.com/item?id=#{item_id}"
  end
end
