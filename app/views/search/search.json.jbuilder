json.array!(@medications) do |medication|
  json.extract! medication, :name, :description, :dosage, :sideeffects
  json.url medication_url(medication, format: :json)
end