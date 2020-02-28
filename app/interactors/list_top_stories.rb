class ListTopStories
  def initialize(
    amount,
    hacker_news_api = HackerNewsAPI.new,
    stories_repository = StoriesRepository.new)

    @amount = amount
    @hacker_news_api = hacker_news_api
    @stories_repository = stories_repository
  end

  def execute
    hacker_news_stories = @hacker_news_api.top_stories(@amount)
    stories = build_model_list(hacker_news_stories)
  end

  private

  def build_model(result)
    attributes = {
      item_id: result['id'],
      title: result['title'],
      author: result['by'],
      published_at: Time.at(result['time']),
      url: result['url']
    }
    Story.new(attributes)
  end

  def build_model_list(results)
    results.map { |result| build_model(result) }
  end
end
