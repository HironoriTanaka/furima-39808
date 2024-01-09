FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 5)}
    description           {Faker::Name.initials(number: 10)}
    category_id           {'2'}
    status_id             {'2'}
    postage_type_id       {'2'}
    prefecture_id         {'11'}
    preparation_day_id    {'2'}
    price                 {'10000'}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
