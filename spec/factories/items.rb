FactoryBot.define do
  factory :item do
    item_title            {'テスト'}
    item_concept          {'テスト'}
    category_id           { '2' }
    status_id             { '2' }
    delivery_charge_id    { '2' } 
    prefecture_id         { '2' }
    delivery_day_id       { '2' }
    price                 { '1000' } 
  end

  after(:build) do |item|
  item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
  end
end
