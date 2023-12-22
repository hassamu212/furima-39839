FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {'テスト'}
    first_name_kana       {'テスト'}
    birthday              {Faker::Date.birthday }
  end
end