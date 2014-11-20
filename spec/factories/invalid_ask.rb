FactoryGirl.define do
  factory :invalid_ask do |f|
    f.project_name         nil
    user
  end
end
