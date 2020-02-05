require 'pry'

Spot.destroy_all
Review.destroy_all
User.destroy_all

1.times do |index|
  @user = User.create!(
    :user_name => Faker::Superhero.name,
    :email => Faker::Lorem.characters(number: 10, min_alpha: 4) + "@user.com")
  end

  p "Created #{User.count} users"

15.times do |index|
  spots = []
  spots.push(Spot.create!( name: Faker::Verb.unique.base.capitalize() + " Park",
    lat: Faker::Address.latitude,
    lon: Faker::Address.longitude,
    description: Faker::Space.distance_measurement + " from " +     Faker::Verb.unique.base.capitalize() + " Park",
    features: Faker::Construction.material + " " +   Faker::Appliance.equipment,
    spot_type: Faker::Movies::HitchhikersGuideToTheGalaxy.starship,
    img: Faker::LoremFlickr.grayscale_image(size: "50x60")
      ))
  spots


  Review.create!(
    :title => Faker::Superhero.name,
    :content => Faker::Lorem.characters(number: 55, min_alpha: 4),
    :user_id => @user.id,
    :rating => rand(1..5),
    :heat_lvl => rand(1..5),
    :spot_id => spots.sample.id
    )

end

p "Created #{Spot.count} spots"
p "Created #{Review.count} reviews"
