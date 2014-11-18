FactoryGirl.define do
  factory :user do |f|
    f.first_name       "Test"
    f.last_name        "User"
    f.email            "test@example.com"
    f.password         "helloworld"
    f.location         "test location"
    f.skill            "test skill"
    f.status           "test status"
    f.achievement      "test achievement"
    f.portfolio        "test portfolio"
  end
end
