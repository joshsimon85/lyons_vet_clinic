# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
power_user = Role.create({ :name => 'power user',
                           :description => 'External user' })
admin = Role.create({ :name => 'admin',
                      :description => 'Internal employee' })
employee = Role.create({ :name => 'employee',
                         :description => 'Internal employee' })
user = Role.create({ :name => 'user', :description => 'External customer' })

vet_tech = Position.create({ :title => 'Vet tech', :description => 'Vet tech'} )

power_user = User.create({ :full_name => 'Jon Doe',
                           :email => 'jon@doe.com',
                           :password => 'password',
                           :confirmed_at => Time.now,
                           :role => power_user })

admin = User.create({ :full_name => 'Jon Doe',
                           :email => 'jon@doe.com',
                           :password => 'password',
                           :confirmed_at => Time.now,
                           :role => admin,
                           :position => vet_tech,
                           :description => 'Fun person' })

employee = User.create({ :full_name => 'Jan Doe',
                         :email => 'jan@doe.com',
                         :password => 'password',
                         :confirmed_at => Time.now,
                         :role => employee,
                         :position => vet_tech,
                         :description => 'Fun employee' })

user = User.create({ :full_name => 'External User',
                     :email => 'user@user.com',
                     :password => 'password',
                     :confirmed_at => Time.now,
                     :role => user })
