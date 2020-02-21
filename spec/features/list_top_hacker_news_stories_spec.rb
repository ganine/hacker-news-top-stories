require 'rails_helper'

describe 'List top Hacker News stories', type: :system, js: true do

  it 'shows the top 15 Hacker News stories' do
    visit '/'

    expect(page).to have_content('Top 15 Hacker News')
  end
end
