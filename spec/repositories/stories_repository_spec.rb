require 'rails_helper'

describe StoriesRepository, type: :model do
  subject(:repository) { described_class.new }

  let(:story) { build(:story) }

  describe '#add' do
    it 'stores a story' do
      expect { repository.add(story) }.to change(repository, :count).by(1)
    end
  end

  describe '#find_by_item_id' do
    it 'retrieves a story by item_id' do
      repository.add(story)

      expect(repository.find_by_item_id(story.item_id)).not_to be_nil
    end
  end

  describe '#find_by_title' do
    it 'retrieves a stories by title' do
      stories = create_list(:story, 3)

      random_story = stories.sample
      term = random_story.title.split.sample

      results = repository.find_by_title(term)

      expect(results.sample.title).to include(term)
    end
  end

  describe '#most_recent' do
    it 'retrieves most recent stories' do
      stories = create_list(:story, 10)

      amount = stories.size - 3
      results = repository.most_recent(amount)

      expect(results.size).to be_eql(amount)
      expect(results.first).to be_kind_of(Story)
    end
  end

  describe '#count' do
    xit 'counts total of stories stored' do; end
  end
end
