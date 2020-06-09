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

User.create({ :full_name => 'Jon Doe',
                           :email => 'jon@doe.com',
                           :password => 'password',
                           :confirmed_at => Time.now,
                           :role =>  power_user })
