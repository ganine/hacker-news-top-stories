require 'rails_helper'

describe 'Search Hacker News stories', type: :system, js: true do
  before :all do
    VCR.insert_cassette 'hacker_news_search_stories'
  end

  after :all do
    VCR.eject_cassette
  end

  it 'searches for a term in Hacker News stories' do
    visit '/'

    titles = within('.stories ol') do
      all('li .story-title')
    end

    random_term = titles.sample.text.split.sample

    fill_in 'Search stories', with: random_term

    click_on 'Search'

    results = within('.stories ol') do
      all('li .story-title')
    end

    expect(results.sample.text).to include(random_term)
    expect(results.count).to be <= 10
  end
end
