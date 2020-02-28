class StoriesRepository < ApplicationRecord
  self.table_name = 'stories'

  scope :select_model_attributes, (lambda do
    select(%w[id item_id title author published_at url])
  end)

  def most_recent(amount = 1)
    records = dao.select_model_attributes.order(created_at: :desc).limit(amount)
    build_model_list(records)
  end

  private

  def dao
    @dao ||= self.class
  end

  def build_model(record)
    Story.new(record.attributes)
  end

  def build_model_list(records)
    records.map { |record| build_model(record) }
  end
end
