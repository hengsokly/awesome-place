FactoryBot.define do
  factory :place do
    name          { FFaker::Name.name }
    location      { "#{FFaker::Geolocation.lat},#{FFaker::Geolocation.lng}" }
  end
end
