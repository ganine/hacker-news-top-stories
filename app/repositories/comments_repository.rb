class CommentsRepository < ApplicationRecord
  self.table_name = 'comments'

  # belongs_to :story, class_name: 'StoriesRepository'

  scope :select_model_attributes, (lambda do
    select(%w[id item_id author story_id content published_at])
  end)

  def add(comment)
    dao.create(comment.attributes)
  end

  def find_by_item_id(item_id)
    record = dao.select_model_attributes.find_by(item_id: item_id)
    record && build_model(record)
  end

  def find_by_story_id(story_id)
    record = dao.select_model_attributes.find_by(story_id: story_id)
    record && build_model(record)
  end

  def count
    dao.count
  end

  private

  def dao
    @dao ||= self.class
  end

  def build_model(record)
    Comment.new(record.attributes)
  end

  def build_model_list(records)
    records.map { |record| build_model(record) }
  end
end
