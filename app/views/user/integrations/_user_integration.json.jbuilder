json.extract! user_integration, :id, :software_type, :software_username, :software_api_key, :created_at, :updated_at
json.url user_integration_url(user_integration, format: :json)