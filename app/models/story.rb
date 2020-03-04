class Story
  include ActiveModel::Model
  attr_accessor :attributes

  attr_accessor :id
  attr_accessor :item_id
  attr_accessor :title
  attr_accessor :author
  attr_accessor :published_at
  attr_accessor :url
  attr_accessor :comments_count

  def initialize(attributes = {})
    super
    @attributes = attributes
  end
end
