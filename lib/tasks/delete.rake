namespace :cleanup do
  desc "Delete asks 7 days after submission"
  task :delete_asks do
    Ask.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
