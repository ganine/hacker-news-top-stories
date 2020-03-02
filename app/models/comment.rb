class Comment
  include ActiveModel::Model
  attr_accessor :attributes

  attr_accessor :id
  attr_accessor :item_id
  attr_accessor :author
  attr_accessor :story_id
  attr_accessor :content
  attr_accessor :published_at

  RELEVANT_WORD_COUNT = 21

  def initialize(attributes = {})
    super
    @attributes = attributes
  end

  def content
    @content || ''
  end

  def relevant?
    content_word_count >= RELEVANT_WORD_COUNT
  end

  private

  def content_word_count
    content.split.size
  end
end
