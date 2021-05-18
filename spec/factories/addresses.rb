FactoryBot.define do
  factory :address do
    postal      {"123-4567"}
    city        {"横浜市緑区"}
    address     {"青山1-1-1"}
    number      {"09012345678"}
    area_id     {2}
    association :order
  end
end
