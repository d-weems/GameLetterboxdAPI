FactoryBot.define do
  factory :user do
    username { "sweetdweems" }
    password { "secret" }
    password_confirmation { "secret" }
  end
end