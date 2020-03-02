class CommentsRepository < ApplicationRecord
  self.table_name = 'comments'

  belongs_to :story, class_name: 'StoriesRepository'
end
