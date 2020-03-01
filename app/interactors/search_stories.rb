class SearchStories
  DEFAULT_MAX_RESULTS = 10

  def initialize(
    term,
    max_results = DEFAULT_MAX_RESULTS,
    stories_repository = StoriesRepository.new
  )

    @term = term
    @max_results = max_results
    @stories_repository = stories_repository
  end

  def execute
    @stories_repository.find_by_title(@term, @max_results)
  end
end
