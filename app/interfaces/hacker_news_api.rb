class HackerNewsAPI
  def initialize
    @connection = Faraday.new(
      url: 'https://hacker-news.firebaseio.com/v0/'
    )
  end

  def top_stories_ids(amount = 15)
    response = @connection.get('topstories.json')
    stories_ids = JSON.parse(response.body)
    stories_ids.take(amount)
  end

  def item(item_id)
    response = @connection.get("item/#{item_id}.json")
    JSON.parse(response.body)
  end

  alias_method :story, :item
  alias_method :comment, :item
end
