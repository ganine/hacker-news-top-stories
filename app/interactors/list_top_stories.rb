class ListTopStories
  DEFAULT_AMOUNT = 15

  def initialize(
    amount = DEFAULT_AMOUNT,
    hacker_news_api = HackerNewsAPI.new,
    stories_repository = StoriesRepository.new
  )

    @amount = amount
    @hacker_news_api = hacker_news_api
    @stories_repository = stories_repository
  end

  def execute
    @hacker_news_api.top_stories_ids(@amount).map do |item_id|
      story = @stories_repository.find_by_item_id(item_id)

      unless story.present?
        result = @hacker_news_api.story(item_id)
        story = build_model(result)
        @stories_repository.add(story)
      end

      story
    end
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
