require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to respond_to :item_id }
  it { is_expected.to respond_to :author }
  it { is_expected.to respond_to :story_id }
  it { is_expected.to respond_to :content }
  it { is_expected.to respond_to :published_at }

  describe '#relevant?' do
    let(:relevant_word_count) { Comment::RELEVANT_WORD_COUNT }

    it 'returns true when content has a relevant word count' do
      relevant_content = Faker::Lorem.sentence(word_count: relevant_word_count)

      comment = Comment.new(content: relevant_content)

      expect(comment).to be_relevant
    end

    it 'returns false when content is empty or have less than relevant word count' do
      expect(Comment.new).not_to be_relevant

      irrelevant_content = Faker::Lorem.sentence(word_count: relevant_word_count - 1)

      comment = Comment.new(content: irrelevant_content)

      expect(comment).not_to be_relevant
    end
  end
end
