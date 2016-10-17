# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.delete_all

Product.all.each do |product|
  product.categories.each do |category|
    product.categories.delete(category)
  end
end

Category.all.each do |category|
  category.products.each do |product|
    category.products.delete(product)
  end
end

Product.delete_all
Category.delete_all
User.delete_all


buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pvdh@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Robert", email: "robert@gmail.com", role: "seller", password: "abcd1234"} )

category1 = Category.create ( {name: "Offline"} )
category2 = Category.create ( {name: "Online"} )
category3 = Category.create ( {name: "Books"} )




photo1 = Photo.create(remote_image_url: "https://res-5.cloudinary.com/pvdh/image/upload/v1476440740/images_1_omcysk.jpg")
photo2 = Photo.create(remote_image_url: "https://res-1.cloudinary.com/pvdh/image/upload/v1476440740/images_sbvyyl.jpg")
photo3 = Photo.create(remote_image_url: "https://res-1.cloudinary.com/pvdh/image/upload/v1476440740/download_1_nighk0.jpg")

photo4 = Photo.create(remote_image_url: "https://res-4.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440746/teach-english-uz_rd4soi.jpg")
photo5 = Photo.create(remote_image_url: "https://res-5.cloudinary.com/pvdh/image/upload/v1476440753/studying_fip1uo.jpg")
photo6 = Photo.create(remote_image_url: "https://res-4.cloudinary.com/pvdh/image/upload/v1476440744/mZLDnnoSm6j7c8iSKiag_51qiS5gf-HL._SX337_BO1_204_203_200__nadevf.jpg")

photo7 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/v1476440739/download_k2bjie.png")
photo8 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/v1476440739/download_myywvs.jpg")
photo9 = Photo.create(remote_image_url: "https://res-3.cloudinary.com/pvdh/image/upload/v1476440759/good-study-habits_rdr4lx.png")

photo10 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440749/crop380w_istock_000002193842xsmall-books_jil6v3.jpg")
photo11 = Photo.create(remote_image_url: "https://res-1.cloudinary.com/pvdh/image/upload/v1476440741/images_2_mpmrpw.jpg")
photo12 = Photo.create(remote_image_url: "https://res-4.cloudinary.com/pvdh/image/upload/v1476440740/download_2_qtqoqq.jpg")




product1 = Product.create ( {name: "French Lesson", price: 1.00, description: "lorem ipsum", photos: [photo1], user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "Philosophy Lesson", price: 2.00, description: "lorem ipsum", photos: [photo2], user: seller1, categories: [category2] } )
product3 = Product.create ( {name: "Math lesson", price: 3.00, description: "lorem ipsum", photos: [photo3], user: seller1, categories: [category3] } )
product4 = Product.create ( {name: "Ruby Basic", price: 4.00, description: "lorem ipsum", photos: [photo4], user: seller1, categories: [category1, category2, category3] } )
product5 = Product.create ( {name: "Html Advance", price: 5.00, description: "lorem ipsum", photos: [photo5], user: seller1, categories: [category1, category3] } )
product6 = Product.create ( {name: "How to build a website", price: 6.00, description: "lorem ipsum", photos: [photo6], user: seller1, categories: [category1, category2] } )
product7 = Product.create ( {name: "Learn Intenational Business", price: 7.00, description: "lorem ipsum", photos: [photo7], user: seller1, categories: [category1, category2, category3] } )
product8 = Product.create ( {name: "Photography Basic", price: 17.00, description: "lorem ipsum", photos: [photo8], user: seller1, categories: [category2, category3] } )
product9 = Product.create ( {name: "Photoshop intermediate", price: 1.00, description: "lorem ipsum", photos: [photo9], user: seller1, categories: [category1, category2, category3] } )
product10 = Product.create ( {name: "Beginner Illustrator", price: 3.00, description: "lorem ipsum", photos: [photo10], user: seller1, categories: [category1, category2] } )
product11 = Product.create ( {name: "How to use Sketch", price: 4.00, description: "lorem ipsum", photos: [photo11], user: seller1, categories: [category1, category2, category3] } )
product12 = Product.create ( {name: "Equesion 2nd Level", price: 9.00, description: "lorem ipsum", photos: [photo12], user: seller1, categories: [category2, category3] } )


