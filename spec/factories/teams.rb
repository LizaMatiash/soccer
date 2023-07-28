FactoryBot.define do
  sequence :name do |n|
    "team_#{n}_team"
  end
  factory :team do
    name

    trait :winning do
      points { 10 }
      scored_goals { 5 }
      conceeded_goals { 1 }
      wins { 3 }
      draws { 1 }
      loses { 1 }
    end

    trait :lossing do
      points { 4 }
      scored_goals { 1 }
      conceeded_goals { 5 }
      wins { 1 }
      draws { 1 }
      loses { 3 }
    end
  end
end
