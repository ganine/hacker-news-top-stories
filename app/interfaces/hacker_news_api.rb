class HackerNewsAPI
  def initialize
    @connection = Faraday.new(
      url: 'https://hacker-news.firebaseio.com/v0/'
    )
  end

  def top_stories(amount = 15)
    top_stories_ids(amount).map { |id| story(id) }
  end

  def top_stories_ids(amount = 15)
    response = @connection.get('topstories.json')
    stories_ids = JSON.parse(response.body)
    stories_ids.take(amount)
  end

  def story(item_id)
    response = @connection.get("item/#{item_id}.json")
    JSON.parse(response.body)
  end
end
