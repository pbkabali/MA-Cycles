json.extract! user, :id, :Username, :FullName, :Photo, :CoverImage, :created_at, :updated_at
json.url user_url(user, format: :json)
