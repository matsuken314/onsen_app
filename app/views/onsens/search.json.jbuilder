json.array!(@onsens) do |onsen|
  json.name onsen.name
  onsen.address
end
