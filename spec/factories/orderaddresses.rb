FactoryBot.define do
  factory :orderaddress do
    address { "111-1111" }
    prefecture_id { "2" }
    municipalities { "世田谷区" }
    street_address { "世田谷0-0-0" }
    building_name { "テスト" }
    telephone_number { "0000000000" }
    token {"test"}
  end
end
