FactoryBot.define do
  factory :story, class: 'StoriesRepository' do
    title { Faker::Lorem.sentence }
    author { Faker::Name.name }
    published_at do
      Faker::Time.between_dates(
        from: Time.zone.today - 30,
        to: Time.zone.today,
        period: :all
      )
    end
    url { Faker::Internet.url }
    item_id { Faker::Number.number(digits: 8) }
  end
end
