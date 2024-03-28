FactoryBot.define do
  factory :gamelog do
    association :game
    association :user
    review_score { 5 }
    review_content { "Game of the year!" }
    log_date { Date.current }
  end
end