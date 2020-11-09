json.extract! following, :id, :FollowerId, :FollowedId, :created_at, :updated_at
json.url following_url(following, format: :json)
