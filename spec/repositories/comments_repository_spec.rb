require 'rails_helper'

describe CommentsRepository, type: :model do
  subject(:repository) { described_class.new }

  let(:comment) { build(:comment) }

  describe '#add' do
    it 'stores a comment' do
      expect { repository.add(comment) }.to change(repository, :count).by(1)
    end
  end

  describe '#find_by_item_id' do
    it 'retrieves a comment by item_id' do
      repository.add(comment)

      expect(repository.find_by_item_id(comment.item_id)).not_to be_nil
    end
  end

  describe '#find_by_story_id' do
    xit 'retrieves a stories by title' do; end
  end
end
