class ListTopStories
  def initialize(amount, stories_repository = StoriesRepository.new)
    @amount = amount
    @stories_repository = stories_repository
  end

  def execute
    @stories_repository.most_recent(@amount)
  end
end
