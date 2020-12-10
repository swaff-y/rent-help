# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Property.destroy_all
PropertyImage.destroy_all
Rating.destroy_all


tenant_array = []
tenant_rating_array = [];
15.times do
  create = Tenant.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    password: 'chicken',
    verified: Faker::Boolean.boolean
  )
  tenant_array.push create
  create_rating = TenantRating.create!(
    rating: rand(1..5)
  )
  tenant_rating_array.push create_rating
end

puts "15 tenants created"
puts "15 tenant ratings created"

owner_array = []
owner_rating_array = []
5.times do
  create = Owner.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    password: 'chicken',
    verified: Faker::Boolean.boolean
  )
  owner_array.push create
  create_rating = OwnerRating.create!(
    rating: rand(1..5)
  )
  owner_rating_array.push create_rating
end

puts "5 owners created"
puts "5 owner ratings created"

owner_admin = Owner.create!(

  name: "admin",
  email: "admin@rent-help.pt",
  phone: 0000000000,
  password: "chicken",
  verified: true
)

puts "admin created"

property_array = [];
10.times do |i|
  num = rand 1..10
  num = num.to_s

  streets = ["104 Fairway Drive", "59 Brickmans Lane", "135 Vermont Road", "2 Surfleet Place", "6 Goodwin Road", "372 Old Northern Road", "7-9 Warners Avenue", "471 Captain Cook Drive", "156 Tallai Road", "1 Beatrice Terrace"]
  cities = ["Baulkham Hills", "Lovedale", "Mulbring", "Kiama", "Newport", "Castle Hill", "Willoughby","Woolooware", "Tallai", "Ascot"]
  states = [ "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "QLD", "QLD",]
  postcodes = ["2153", "2325", "2323", "2533", "2106", "2154", "2068", "2230", "4213", "4007"]

  create = Property.create!(
    unit: '',
    street: streets[i],
    city: cities[i],
    state: states[i],
    postcode: postcodes[i],
    bedrooms: rand(1..5),
    description: Faker::Lorem.paragraphs,
    bathrooms: rand(1..3),
    area: rand(100).to_s,
    garage: rand(3),
    storage: Faker::Boolean.boolean,
    leased: Faker::Boolean.boolean,
    lease_start: Faker::Date.between(from: '2020-04-01', to: '2020-06-01'),
    lease_end: Faker::Date.between(from: '2020-10-01', to: '2020-12-01'),
    cover_image: "image" + num  + ".jpeg",
  )

  property_array.push create
end

puts "10 properties created"

image_array = []
100.times do |i|
  num = rand 1..10
  num = num.to_s
  create = PropertyImage.create!(
    name: Faker::Lorem.word,
    image_url: "image" + num  + ".jpeg"
  )
  image_array.push create
end

puts "100 images created"

5.times do |i|
  owner_array[i].properties <<  property_array[i] << property_array[i + 5]
end

puts "Testing owners -< properties associations:"
puts "The property '#{ Property.first.street }' is by #{Property.first.owner.name}"
puts "The owner #{ Owner.last.name } has the property: #{ Owner.last.properties.pluck(:street).join(', ') }"

5.times do |i|
  property_array[i].tenants <<  tenant_array[i] << tenant_array[i + 5] << tenant_array[i + 10]
end

puts "Testing tenants >-< properties associations:"
puts "The property '#{ Property.first.street }' is leased by #{Property.first.tenants.pluck(:name)}"
puts "The tenant #{ Tenant.last.name } is leasing: #{ Tenant.last.properties.pluck(:street).join(', ') }"

10.times do |i|
  property_array[i].property_images << image_array[i] << image_array[i + 10] << image_array[i + 20] << image_array[i + 30] << image_array[i + 40] << image_array[i + 50] << image_array[i + 60] << image_array[i + 70] << image_array[i + 80] << image_array[i + 90]
end

puts "Testing property -< images associations:"
puts "The image '#{ PropertyImage.first.name }' is by"
puts PropertyImage.first.property.street
puts "The property #{ Property.last.street} has the images: #{ Property.last.property_images.pluck(:name).join(', ') }"

5.times do |i|
  owner_array[i].owner_ratings <<  owner_rating_array[i]
end

puts "Testing owners -< owner rating associations:"
puts "The rating '#{ OwnerRating.first.rating }' is by #{OwnerRating.first.owner.name}"
puts "The owner #{ Owner.last.name } has the rating: #{ Owner.last.owner_ratings.pluck(:rating).join(', ') }"

15.times do |i|
  tenant_array[i].tenant_ratings <<  tenant_rating_array[i]
end

puts "Testing tenants -< tenant rating associations:"
puts "The rating '#{ TenantRating.first.rating }' is by #{TenantRating.first.tenant.name}"
puts "The tenant #{ Tenant.last.name } has the rating: #{ Tenant.last.tenant_ratings.pluck(:rating).join(', ') }"
