json.array!(@videos) do |video|
  json.extract! video, :id, :url, :expert, :category, :subcategory, :date
  json.url video_url(video, format: :json)
end
