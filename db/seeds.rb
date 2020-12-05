# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Tenant.destroy_all
Owner.destroy_all
Property.destroy_all


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
    address: Faker::Address.full_address,
    bedrooms: 2,
    description: '',
    bathrooms: 2,
    area: 'test',
    garage: 2,
    storage: Faker::Boolean.boolean,
    leased: Faker::Boolean.boolean,
    lease_start: Faker::Date.between(from: '2020-04-01', to: '2020-06-01'),
    lease_end: Faker::Date.between(from: '2020-10-01', to: '2020-12-01'),
    cover_image: 'http://www.fillmurray.com/300/200',
    image_1: 'http://www.fillmurray.com/300/200',
    image_2: 'http://www.fillmurray.com/300/200',
    image_3: 'http://www.fillmurray.com/300/200',
    image_4: 'http://www.fillmurray.com/300/200',
    image_5: 'http://www.fillmurray.com/300/200',
    image_6: 'http://www.fillmurray.com/300/200',
    image_7: 'http://www.fillmurray.com/300/200',
    image_8: 'http://www.fillmurray.com/300/200',
    image_9: 'http://www.fillmurray.com/300/200',
    image_10: 'http://www.fillmurray.com/300/200'
  )
  property_array.push create
end

puts "5 owners created"

5.times do |i|
  owner_array[i].properties <<  property_array[i] << property_array[i + 5]
end

puts "Testing owners -< properties associations:"
puts "The property '#{ Property.first.address }' is by #{Property.first.owner.name}"
puts "The owner #{ Owner.last.name } has the property: #{ Owner.last.properties.pluck(:address).join(', ') }"

5.times do |i|
  property_array[i].tenants <<  tenant_array[i] << tenant_array[i + 5] << tenant_array[i + 10]
end

puts "Testing tenants >-< properties associations:"
puts "The property '#{ Property.first.address }' is leased by #{Property.first.tenants.pluck(:name)}"
puts "The tenant #{ Tenant.last.name } is leasing: #{ Tenant.last.properties.pluck(:address).join(', ') }"
