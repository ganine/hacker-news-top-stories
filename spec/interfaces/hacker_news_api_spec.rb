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
    it 'fetches top stories from Hacker News API' do
      results = hacker_news.top_stories

      expect(results).to be_kind_of(Array)

      fields = %w[by descendants id kids score time title type url]
      expect(results.sample.keys).to include(*fields)
    end
  end
end
