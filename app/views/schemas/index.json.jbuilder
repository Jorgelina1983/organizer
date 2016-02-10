json.array!(@schemas) do |schema|
  json.extract! schema, :id
  json.url schema_url(schema, format: :json)
end
