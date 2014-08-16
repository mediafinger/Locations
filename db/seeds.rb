#encoding: utf-8

if Rails.env == "development"
 # puts "Cleaning DB first ..."
 # Location.destroy_all
end

puts "Creating Locations"  # Always create seeds with lat & long & result to not cause API calls!
Location.create!(latitude: 41.3830973, longitude: 2.1675154,    search: "Barcelona, Spain, Plaça dels Ángels, 1,", result: "Plaça Àngels, 1, 08001 Barcelona, Barcelona, Spain")
Location.create!(latitude: 41.3788985, longitude: 2.1694266,    search: "Barcelona, Spain, Rambla del Raval", result: "Rambla del Raval, 25, 08001 Barcelona, Barcelona, Spain")
Location.create!(latitude: 41.379405,  longitude: 2.180371,     city: "Barcelona", street: "Carrer de Merce, 5", result: "Carrer de la Mercè, 5, 08002 Barcelona, Barcelona, Spain")
Location.create!(latitude: 41.2371851, longitude: 1.805886,     country: "ES", city: "Sitges", result: "Carrer d'Antoni Gaudí, 2-16, 08870 Sitges, Barcelona, Spain")
Location.create!(latitude: 51.5073509, longitude: -0.1277583,   country: "UK", city: "London", result: "3 Whitehall, London SW1A 2EL, UK")
Location.create!(latitude: 49.2568215, longitude: -123.1125015, result: "3200 Yukon Street, Vancouver, BC V5Y 3R9, Canada")
Location.create!(latitude: 53.5511779, longitude: 9.964175899999999, search: "DE Hamburg 20359", result: "Rendsburger Straße 4, 20359 Hamburg, Germany")
