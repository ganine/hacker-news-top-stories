FactoryBot.define do
  factory :comment, class: 'CommentsRepository' do
    author { Faker::Name.name }
    item_id { Faker::Number.number(digits: 8) }
    story_id { create(:story).item_id }
    content { Faker::Lorem.paragraph }
    published_at do
      Faker::Time.between_dates(
        from: Time.zone.today - 30,
        to: Time.zone.today,
        period: :all
      )
    end
  end
end
