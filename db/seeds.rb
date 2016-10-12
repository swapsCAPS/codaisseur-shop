# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Category.delete_all
Product.delete_all

buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pvdh@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Robert", email: "robert@gmail.com", role: "seller", password: "abcd1234"} )

category1 = Category.create ( {name: "Offline"} )
category2 = Category.create ( {name: "Online"} )
category3 = Category.create ( {name: "Books"} )

product1 = Product.create ( {name: "product1", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "product2", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2] } )
product3 = Product.create ( {name: "product3", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category3] } )
product4 = Product.create ( {name: "product4", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3] } )
product5 = Product.create ( {name: "product5", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category3] } )
product6 = Product.create ( {name: "product6", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2] } )
product7 = Product.create ( {name: "product7", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3] } )
product8 = Product.create ( {name: "product8", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2, category3] } )
product9 = Product.create ( {name: "product9", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3] } )
product10 = Product.create ( {name: "product10", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2] } )
product11 = Product.create ( {name: "product11", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3] } )
product12 = Product.create ( {name: "product12", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2, category3] } )
