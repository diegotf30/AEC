# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = ['Mexico', 'EUA', 'Colombia', 'Siberia', 'Japon', 'Bolivia', 'Bosnia', 'Iran', 'Italy', 'Peru', 'Pitcairn', 'Solomon Island', 'Uganda']
countries.each do |c|
  Country.create(name: c)
end

cities = ['Monterrey', 'Saltillo', 'Distrito Federal', 'San Pedro']

cities.each do |c|
  City.create(name: c, country: Country.first)
end

sectors = ['Anahuac', 'San Jeronimo', 'Cumbres', 'Contry', 'Obispado', 'Mitras']

sectors.each do |s|
  Sector.create(name: s, city: City.first)
end

groups = ['Sagrado Corazón de Jesus', 'Inmaculado Corazon de Maria', 'Santisimo Sacramento', 'Maria Reina de las Familias']

groups.each do |g|
  Group.create(name: g, day: 'vie', hour: '6:00', phone: '9876543210', sector: Sector.first)
end
