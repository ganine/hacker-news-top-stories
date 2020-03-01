class SearchStories
  def initialize(
    term,
    stories_repository = StoriesRepository.new
  )

    @term = term
    @stories_repository = stories_repository
  end

  def execute
    @stories_repository.find_by_title(@term)
  end
end
