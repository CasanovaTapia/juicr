json.array!(@asks) do |ask|
  json.extract! ask, :id, :project_name, :project_description, :category, :skills, :time_commitment, :location, :expectations, :user_id
  json.url ask_url(ask, format: :json)
end
