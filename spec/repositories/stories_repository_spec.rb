require 'rails_helper'

describe StoriesRepository, type: :model do

  subject(:repository) { described_class.new }

  describe '#most_recent' do
    it 'retrieves most recent stories' do
      stories = create_list(:story, 10)

      amount = stories.size - 3
      results = repository.most_recent(amount)

      expect(results.size).to be_eql(amount)
      expect(results.first).to be_kind_of(Story)
    end
  end
end
