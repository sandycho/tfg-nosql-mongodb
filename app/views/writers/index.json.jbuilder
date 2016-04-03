json.array!(@writers) do |writer|
  json.extract! writer, :id, :name, :number_of_posts
  json.url writer_url(writer, format: :json)
end
