require 'rails_helper'

describe SearchStories, type: :request do
  describe '#execute' do

    let(:max_results) { 3 }
    let(:repository) { double('StoriesRepository') }

    it 'looks for stories that include a term' do
      term = 'any words'
      allow(repository).to receive(:find_by_title).with(term, max_results)

      interactor = described_class.new(term, max_results, repository)

      interactor.execute
    end
  end
end
