FactoryGirl.define do
  factory :ask do |f|
    f.project_name         "test project"
    f.project_description  "test project description"
    f.skills               "test skills"
    f.time_commitment      "7 days"
    f.location             "test location"
    f.expectations         "test expectations"
  end
end
