FactoryBot.define do
  factory :item do
    name         {Faker::Name.name}
    text         {Faker::Lorem.sentence}
    price        {2000}
    category_id  {2}
    status_id    {2}
    postage_id   {2}
    area_id      {2}
    day_id       {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
