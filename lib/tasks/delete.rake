namespace :cleanup do
  desc "Delete asks 7 days after submission"
  task :delete_asks => :environment do
    Ask.where("created_at <= ?", Time.now - 14.days).destroy_all
  end
end
