require 'rails_helper'

describe ListTopStories, type: :request do
  before :all do
    VCR.insert_cassette 'hacker_news_list_stories'
  end

  after :all do
    VCR.eject_cassette
  end

  describe '#execute' do
    let(:hacker_news) { HackerNewsAPI.new }
    let(:repository) { double('StoriesRepository') }
    let(:amount) { 15 }

    it 'returns top stories from API' do
      allow(hacker_news).to receive(:top_stories_ids).with(amount).and_call_original
      allow(repository).to receive(:find_by_item_id).exactly(amount).times
      allow(repository).to receive(:add).with(kind_of(Story))

      interactor = described_class.new(amount, hacker_news, repository)

      stories = interactor.execute

      expect(stories.size).to be_eql(amount)
      expect(stories.sample).to be_kind_of(Story)
    end
  end
end
