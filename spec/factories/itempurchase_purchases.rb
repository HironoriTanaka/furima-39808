FactoryBot.define do
  factory :itempurchase_purchase do
    token { 'tok_abcdefghijk00000000000000000'}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building_name { '東京ハイツ' }
    tel { '00011112222' }
  end
end
