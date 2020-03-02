class CommentPresenter
  def initialize(comment)
    @comment = comment
  end

  def as_json(*)
    {
      id: @comment.item_id,
      author: {
        user: @comment.author,
        url: user_url(@comment.author)
      },
      content: @comment.content,
      publishedAt: format_datetime(@comment.published_at),
      url: url(@comment.item_id)
    }
  end

  private

  def format_datetime(datetime)
    datetime.strftime('%m/%d/%Y %H:%M')
  end

  def user_url(username)
    "https://news.ycombinator.com/user?id=#{username}"
  end

  def url(item_id)
    "https://news.ycombinator.com/item?id=#{item_id}"
  end
end
