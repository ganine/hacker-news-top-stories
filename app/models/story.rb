class Story
  include ActiveModel::Model

  attr_accessor :id
  attr_accessor :item_id
  attr_accessor :title
  attr_accessor :author
  attr_accessor :published_at
  attr_accessor :url
end
