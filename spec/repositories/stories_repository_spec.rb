require 'rails_helper'

describe StoriesRepository, type: :model do

  subject(:repository) { described_class.new }

  describe '#most_recent' do
    it 'retrieves most recent stories' do
      stories = create_list(:story, 10)

      amount = stories.size - 3
      retrieved = repository.most_recent(amount)

      expect(retrieved.size).to be_eql(amount)
    end
  end
end
