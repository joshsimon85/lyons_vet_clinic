power_user = Role.create({ :name => 'power user',
                           :description => 'External user',
                           :deletable => false })
admin = Role.create({ :name => 'admin',
                      :description => 'Internal employee',
                      :deletable => false })
employee = Role.create({ :name => 'employee',
                         :description => 'Internal employee',
                         :deletable => false })
external_user = Role.create({ :name => 'user',
                     :description => 'External customer',
                     :deletable => false })

vet_tech = Position.create({ :name => 'Vet tech', :description => 'Vet tech'} )

User.create({ :full_name => 'Jon Doe',
                           :email => 'jon@doe.com',
                           :password => 'password',
                           :confirmed_at => Time.now,
                           :role =>  power_user })

User.create({ :full_name => 'Admin User',
                           :email => 'admin@user.com',
                           :password => 'password',
                           :confirmed_at => Time.now,
                           :role => admin,
                           :position => vet_tech,
                           :description => 'Fun person' })

User.create({ :full_name => 'Jane Doe',
                         :email => 'jane@doe.com',
                         :password => 'password',
                         :confirmed_at => Time.now,
                         :role => employee,
                         :position => vet_tech,
                         :description => 'Fun employee' })

User.create({ :full_name => 'External User',
                     :email => 'user@user.com',
                     :password => 'password',
                     :confirmed_at => Time.now,
                     :role_id => external_user })
