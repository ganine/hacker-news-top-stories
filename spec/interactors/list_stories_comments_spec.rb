require 'rails_helper'

describe ListStoryComments, type: :request do
  before :all do
    VCR.insert_cassette 'hacker_news_list_comments'
  end

  after :all do
    VCR.eject_cassette
  end

  describe '#execute' do
    let(:hacker_news) { HackerNewsAPI.new }
    let(:repository) { double('CommentsRepository') }
    let(:story_id) {  }

    xit 'returns story comments from API' do
      allow(hacker_news).to receive(:story).and_call_original
      allow(hacker_news).to receive(:comment).and_call_original
      allow(repository).to receive(:find_by_item_id)
      allow(repository).to receive(:add).with(kind_of(Comment))

      interactor = described_class.new(story_id, hacker_news, repository)

      stories = interactor.execute

      expect(stories.sample).to be_kind_of(Comment)
    end
  end
end
