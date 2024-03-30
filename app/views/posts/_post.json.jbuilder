json.extract! post, :id, :question, :answer, :view_count, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
