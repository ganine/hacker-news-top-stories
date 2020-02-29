require 'rails_helper'

describe HackerNewsAPI do
  before :all do
    VCR.insert_cassette 'hacker_news'
  end

  after :all do
    VCR.eject_cassette
  end

  let(:hacker_news) { HackerNewsAPI.new }

  describe '#top_stories' do
    it 'fetches top stories' do
      results = hacker_news.top_stories

      expect(results).to be_kind_of(Array)

      fields = %w[by descendants id score time title type url]
      expect(results.sample.keys).to include(*fields)
    end
  end

  describe '#top_stories_ids' do
    it 'fetches top stories ids' do
      amount = 10
      results = hacker_news.top_stories_ids(amount)

      expect(results).to be_kind_of(Array)
      expect(results.sample).to be_kind_of(Integer)
      expect(results.size).to be_eql(amount)
    end
  end

  describe '#story' do
    it 'fetches an story' do
      stories_ids = hacker_news.top_stories_ids

      result = hacker_news.story(stories_ids.first)

      fields = %w[by descendants id score time title type url]
      expect(result.keys).to include(*fields)
    end
  end
end
