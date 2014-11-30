# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Make Pokemon
%w(Test1 Test2 Test3 Test4).each do |name|
  Project.create name: name, description: "this is a test project"
end

# Make other users
%w(Adam Bob Carl David).each do |name|
  User.create name: name, email: name+"@calsource.com", password: 'password'
end
