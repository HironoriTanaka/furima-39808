FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    lastname_kanji        {'大阪'}
    firstname_kanji       {'太郎'}
    lastname_kana         {'オオサカ'}
    firstname_kana        {'タロウ'}
    birth                 {'2000-01-01'}
  end
end