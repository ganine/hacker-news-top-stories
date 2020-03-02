require 'rails_helper'

describe 'Stories API', type: :request do
  describe 'GET /api/stories' do
    before :all do
      VCR.insert_cassette 'hacker_news_stories'

      get '/api/stories'
    end

    after :all do
      VCR.eject_cassette
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns an array of stories' do
      stories = JSON.parse(response.body)
      expect(stories).to be_a(Array)
    end
  end

  describe 'GET /api/stories/:id/comments' do
    before :all do
      VCR.insert_cassette 'hacker_news_comments'

      get '/api/stories'
      stories = JSON.parse(response.body)
      story_id = stories.sample['id']

      get "/api/stories/#{story_id}/comments"
    end

    after :all do
      VCR.eject_cassette
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns an array of story comments' do
      stories = JSON.parse(response.body)
      expect(stories).to be_a(Array)
    end
  end

  describe 'GET /api/stories/search' do
    let(:stories) { create_list(:story, 5) }

    it 'returns an array of found stories' do
      random_story = stories.sample
      term = random_story.title.split.sample

      get "/api/stories/search?term=#{term}"

      results = JSON.parse(response.body)

      expect(results.sample['title']).to include(term)
    end
  end
end
