# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.delete_all
Category.delete_all
Product.delete_all
User.delete_all


buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pvdh@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Robert", email: "robert@gmail.com", role: "seller", password: "abcd1234"} )

category1 = Category.create ( {name: "Offline"} )
category2 = Category.create ( {name: "Online"} )
category3 = Category.create ( {name: "Books"} )


product1 = Product.create ( {name: "product1", price: 1.00, description: "lorem ipsum", image: "https://res-4.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440746/teach-english-uz_rd4soi.jpg", user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "product2", price: 2.00, description: "lorem ipsum", image: "https://res-5.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440753/studying_fip1uo.jpg", user: seller1, categories: [category2] } )
product3 = Product.create ( {name: "product3", price: 3.00, description: "lorem ipsum", image: "https://res-4.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440744/mZLDnnoSm6j7c8iSKiag_51qiS5gf-HL._SX337_BO1_204_203_200__nadevf.jpg", user: seller1, categories: [category3] } )
product4 = Product.create ( {name: "product4", price: 4.00, description: "lorem ipsum", image: "https://res-1.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440741/images_2_mpmrpw.jpg", user: seller1, categories: [category1, category2, category3] } )
product5 = Product.create ( {name: "product5", price: 5.00, description: "lorem ipsum", image: "https://res-5.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440740/images_1_omcysk.jpg", user: seller1, categories: [category1, category3] } )
product6 = Product.create ( {name: "product6", price: 6.00, description: "lorem ipsum", image: "https://res-1.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440740/images_sbvyyl.jpg", user: seller1, categories: [category1, category2] } )
product7 = Product.create ( {name: "product7", price: 7.00, description: "lorem ipsum", image: "https://res-4.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440740/download_2_qtqoqq.jpg", user: seller1, categories: [category1, category2, category3] } )
product8 = Product.create ( {name: "product8", price: 17.00, description: "lorem ipsum", image: "https://res-1.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440740/download_1_nighk0.jpg", user: seller1, categories: [category2, category3] } )
product9 = Product.create ( {name: "product9", price: 1.00, description: "lorem ipsum", image: "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440739/download_k2bjie.png", user: seller1, categories: [category1, category2, category3] } )
product10 = Product.create ( {name: "product10", price: 3.00, description: "lorem ipsum", image: "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440739/download_myywvs.jpg", user: seller1, categories: [category1, category2] } )
product11 = Product.create ( {name: "product11", price: 4.00, description: "lorem ipsum", image: "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440739/download_k2bjie.png", user: seller1, categories: [category1, category2, category3] } )
product12 = Product.create ( {name: "product12", price: 9.00, description: "lorem ipsum", image: "https://res-3.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440759/good-study-habits_rdr4lx.png", user: seller1, categories: [category2, category3] } )


#  unused photo "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440749/crop380w_istock_000002193842xsmall-books_jil6v3.jpg"