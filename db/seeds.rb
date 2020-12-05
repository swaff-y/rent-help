# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Tenant.destroy_all
Owner.destroy_all
Property.destroy_all
PropertyImage.destroy_all


tenant_array = []
15.times do
  create = Tenant.create!(
  display_name: Faker::Name.unique.name,
  name: Faker::Name.unique.name,
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.cell_phone,
  password_digest: 'chicken',
  verified: Faker::Boolean.boolean
  )
  tenant_array.push create
end

puts "5 tenants created"

owner_array = []
5.times do
  create = Owner.create!(
    display_name: Faker::Name.unique.name,
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    password_digest: 'chicken',
    verified: Faker::Boolean.boolean
  )
  owner_array.push create
end

puts "5 owners created"
# TODO make seperate fields for adress
property_array = [];
10.times do |i|
  create = Property.create!(
    unit: Faker::Address.secondary_address,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postcode: rand(1000..9000),
    bedrooms: rand(5),
    description: Faker::Lorem.paragraphs,
    bathrooms: rand(3),
    area: rand(100).to_s,
    garage: rand(3),
    storage: Faker::Boolean.boolean,
    leased: Faker::Boolean.boolean,
    lease_start: Faker::Date.between(from: '2020-04-01', to: '2020-06-01'),
    lease_end: Faker::Date.between(from: '2020-10-01', to: '2020-12-01'),
    cover_image: 'http://www.fillmurray.com/300/200',
  )
  property_array.push create
end

puts "5 owners created"

image_array = []
100.times do |i|
  create = PropertyImage.create!(
    name: Faker::Lorem.word,
    image_url: Faker::Fillmurray.image(grayscale: false, width: 400, height: 200)
  )
  image_array.push create
end

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
