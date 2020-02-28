class StoriesRepository < ApplicationRecord
  self.table_name = 'stories'

  def most_recent(amount = 1)
    dao.order(created_at: :desc).limit(amount)
  end

  private

  def dao
    @dao ||= self.class
  end
end
