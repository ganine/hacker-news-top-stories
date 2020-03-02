class Comment
  include ActiveModel::Model
  attr_accessor :attributes

  attr_accessor :id
  attr_accessor :item_id
  attr_accessor :author
  attr_accessor :story_id
  attr_accessor :content
  attr_accessor :published_at

  def initialize(attributes = {})
    super
    @attributes = attributes
  end
end
