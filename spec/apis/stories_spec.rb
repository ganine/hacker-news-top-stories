require 'rails_helper'

describe 'Stories API', type: :request do
  describe 'GET /api/stories' do
    before :all do
      get '/api/stories'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns an array of stories' do
      stories = JSON.parse(response.body)
      expect(stories).to eq []
    end
  end
end
