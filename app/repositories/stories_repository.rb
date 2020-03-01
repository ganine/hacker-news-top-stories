class StoriesRepository < ApplicationRecord
  self.table_name = 'stories'

  scope :select_model_attributes, (lambda do
    select(%w[id item_id title author published_at url])
  end)

  def add(story)
    dao.create(story.attributes)
  end

  def find_by_item_id(item_id)
    record = dao.select_model_attributes.find_by(item_id: item_id)
    record && build_model(record)
  end

  def find_by_title(term, max = nil)
    records = dao.select_model_attributes
                 .where(['title ILIKE ?', "%#{term}%"])
                 .limit(max)

    build_model_list(records)
  end

  def most_recent(amount = 1)
    records = dao.select_model_attributes
                 .order(created_at: :desc)
                 .limit(amount)

    build_model_list(records)
  end

  def count
    dao.count
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
