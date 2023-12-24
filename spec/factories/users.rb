FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'a123456'}
    password_confirmation {password}
    family_name           {'日本'}
    first_name            {'太郎'}
    family_name_kana      {'ニッポン'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.birthday }
  end
end