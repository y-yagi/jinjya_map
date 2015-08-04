json.array!(@deities) do |deity|
  json.extract! deity, :id, :name, :name_hiragana, :name_katakana, :detail, :tags
  json.url deity_url(deity, format: :json)
end
