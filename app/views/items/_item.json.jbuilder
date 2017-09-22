json.extract! item, :id, :title, :link, :info, :image_url, :created_at, :updated_at
json.url item_url(item, format: :json)
