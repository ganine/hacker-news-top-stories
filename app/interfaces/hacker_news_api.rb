class HackerNewsAPI
  def top_stories(amount = 15)
    response = Faraday.get('https://hacker-news.firebaseio.com/v0/topstories.json')
    stories_ids = JSON.parse(response.body)

    stories_ids.take(amount).map do |id|
      item_response = Faraday.get("https://hacker-news.firebaseio.com/v0/item/#{id}.json")
      JSON.parse(item_response.body)
    end
  end
end
