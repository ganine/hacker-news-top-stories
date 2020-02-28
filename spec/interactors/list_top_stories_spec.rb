require 'rails_helper'

describe ListTopStories, type: :request do
  describe '#execute' do
    let(:repository) { double('StoriesRepository') }
    let(:amount) { 15 }

    it 'returns top stories' do
      interactor = described_class.new(amount, repository)

      expect(repository).to receive(:most_recent).with(amount)

      interactor.execute
    end
  end
end
