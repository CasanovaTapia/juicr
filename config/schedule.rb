every 1.days do
  rake "cleanup:delete_asks"
end

every 10.minutes do
  rake "searchkick:reindex CLASS=Ask"
end
