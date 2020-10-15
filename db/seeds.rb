# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

denver_dfl = Shelter.create(name: 'Dumb Friends League',
                            address: '2080 S. Quebec St.',
                            city: 'Denver',
                            state: 'CO',
                            zip: '80231')
marie = Pet.create(image: 'http://www.petharbor.com/get_image.asp?RES=thumb&ID=A0834161&LOCATION=DDFL',
                   name: 'Marie',
                   age: 2,
                   sex: 'Female',
                   shelter_id: denver_dfl.id,
                   description: 'Siberian Huskey',
                   status: 'Adoptable')
jax = Pet.create(image: 'http://www.petharbor.com/get_image.asp?RES=thumb&ID=A0833685&LOCATION=DDFL',
                 name: 'Jax',
                 age: 3,
                 sex: 'Male',
                 shelter_id: denver_dfl.id,
                 description: 'Australian Shepherd and Border Collie',
                 status: 'Adoptable')
nisha = Pet.create(image: 'http://www.petharbor.com/get_image.asp?RES=thumb&ID=A0821700&LOCATION=DDFL',
                   name: 'nisha',
                   age: 2,
                   sex: 'Female',
                   shelter_id: denver_dfl.id,
                   description: 'German Shepherd',
                   status: 'Adoptable')

shelter_1 = Shelter.create(name: 'Dumb Friends League',
                          address: '123 ABC Street',
                          city: 'Denver',
                          state: 'Colorado',
                          zip: '12345')
                          
pet_1 = Pet.create(image: 'lib/assets/test_image',
                  name: 'Test_dog',
                  age: 5,
                 sex: 'male',
                 shelter_id: shelter_1.id.to_s)
