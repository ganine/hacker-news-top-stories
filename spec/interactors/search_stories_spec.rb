require 'rails_helper'

describe SearchStories, type: :request do
  describe '#execute' do
    let(:repository) { double('StoriesRepository') }

    it 'looks for stories that include a term' do
      term = 'any words'
      allow(repository).to receive(:find_by_title).with(term)

      interactor = described_class.new(term, repository)

      interactor.execute
    end
  end
end
