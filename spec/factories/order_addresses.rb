FactoryBot.define do
  factory :order_address do
    postal      {"123-4567"}
    city        {"横浜市緑区"}
    address     {"青山1-1-1"}
    number      {"09012345678"}
    area_id     {2}
    token {"tok_abcdefghijk00000000000000000"}
    user_id     {1}
    item_id     {1}
  end
end