# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spot.destroy_all
Review.destroy_all


15.times do |index|
  spots = []
  spots.push(Spot.create!( name: Faker::Verb.unique.base.capitalize() + " Park",
    lat: Faker::Address.latitude,
    lon: Faker::Address.longitude,
    description: Faker::Space.distance_measurement + " from " +     Faker::Verb.unique.base.capitalize() + " Park",
    features: Faker::Construction.material + " " +   Faker::Appliance.equipment,
    spot_type: Faker::Movies::HitchhikersGuideToTheGalaxy.starship,
    avg_rating:  Faker::Number.between(from: 1, to: 5),
    img: Faker::LoremFlickr.grayscale_image(size: "50x60")
    ))
  spots
end

  # rand (3..15).times do |review|
  #   spots.each do |spot|
  #     Review.create! :title => Faker::Superhero.name,
  #     :content => Faker::Lorem.characters(number: 55, min_alpha: 4),
  #     :rating => rand(1..5),
  #     :heat_lvl => rand(1..5),
  #     :spot_id => spot.id
  #   end
  # end



rand(7..23).times do |index|
Review.create!(
  :title => Faker::Superhero.name,
  :content => Faker::Lorem.characters(number: 55, min_alpha: 4),
  :rating => rand(1..5),
  :heat_lvl => rand(1..5),
  :spot_id => rand(1..15)
    )
end


p "Created #{Spot.count} spots"
p "Created #{Review.count} reviews"
