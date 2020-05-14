# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
power_user = Role.create(:name => 'power user', :description => 'External user with admin privileges')
admin = Role.create(:name => 'admin', :description => 'Internal employee with admin privileges')
employee = Role.create(:name => 'employee', :description => 'Internal employee')
user = Role.create(:name => 'user', :description => 'External customer')

power_user = User.create(:full_name => 'Josh Simon', :description => '')
