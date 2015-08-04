json.array!(@shrines) do |shrine|
  json.extract! shrine, :id, :name, :name_hiragana, :name_katakana, :detail, :longitude, :latitude, :address, :hp, :tags
  json.url shrine_url(shrine, format: :json)
end
