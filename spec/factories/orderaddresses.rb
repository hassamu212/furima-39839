FactoryBot.define do
  factory :orderaddress do
    user_id {"1"}
    item_id {"1"}
    address { "111-1111" }
    prefecture_id { "2" }
    municipalities { "世田谷区" }
    street_address { "世田谷0-0-0" }      
    telephone_number { "0000000000" }
  end
end
