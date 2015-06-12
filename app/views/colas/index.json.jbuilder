json.array!(@colas) do |cola|
  json.extract! cola, :id
  json.url cola_url(cola, format: :json)
end
