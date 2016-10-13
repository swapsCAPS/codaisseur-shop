# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Category.delete_all
Photo.delete_all
Product.delete_all

buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pvdh@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Robert", email: "robert@gmail.com", role: "seller", password: "abcd1234"} )

category1 = Category.create ( {name: "Offline"} )
category2 = Category.create ( {name: "Online"} )
category3 = Category.create ( {name: "Books"} )

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/28dab8dd748210a53c77bb284558a5ce5905ca6a_git9a9.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/99ca8b27a84b46c373803df268167d15c3488e99_tvrfql.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/28dab8dd748210a53c77bb284558a5ce5905ca6a_git9a9.jpg")
photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/99ca8b27a84b46c373803df268167d15c3488e99_tvrfql.jpg")
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo7 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo8 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo9 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo10 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo11 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")
photo12 = Photo.create(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png")

product1 = Product.create ( {name: "product1", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1], photos: [photo1] } )
product2 = Product.create ( {name: "product2", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2], photos: [photo2] } )
product3 = Product.create ( {name: "product3", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category3], photos: [photo3] } )
product4 = Product.create ( {name: "product4", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3], photos: [photo4] } )
product5 = Product.create ( {name: "product5", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category3], photos: [photo5] } )
product6 = Product.create ( {name: "product6", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2], photos: [photo6] } )
product7 = Product.create ( {name: "product7", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3], photos: [photo7] } )
product8 = Product.create ( {name: "product8", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2, category3], photos: [photo8] } )
product9 = Product.create ( {name: "product9", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3], photos: [photo9] } )
product10 = Product.create ( {name: "product10", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2], photos: [photo10] } )
product11 = Product.create ( {name: "product11", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category1, category2, category3], photos: [photo11] } )
product12 = Product.create ( {name: "product12", price: 1.00, description: "lorem ipsum", image: "http://placehold.it/350x350", user: seller1, categories: [category2, category3], photos: [photo12] } )
