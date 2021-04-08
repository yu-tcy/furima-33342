FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"海"}
    last_name {"きなこ"}
    family_name_2 {"ウミ"}
    last_name_2 {"キナコ"}
    birthday {"2000-01-01"}
  end
end