# First remove all existing entries from our database
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
Profile.delete_all
User.delete_all

# Create some users
buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pim@gmail.com", role: "buyer", password: "abcd1234"} )                  # please let this be pim@gmail.com
seller1 = User.create( {name: "Robert", email: "robert@gmail.com", role: "seller", password: "abcd1234"} )

#Create profiles

profile1 = Profile.create({first_name:"Robert", last_name:"Hopman", bio:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: seller1})
# Create some categories
category1 = Category.create ( {name: "Beginner"} )
category2 = Category.create ( {name: "Intermediate"} )
category3 = Category.create ( {name: "Advanced"} )

# Create some photos
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

#Default profile picture
profile_photo = Photo.create(remote_image_url: "http://res.cloudinary.com/co/image/upload/v1476797943/facebook-avatar_byjhpd.jpg")

# Create some products
product1 = Product.create ( {name: "French Lesson", price: 1.00, description: Faker::Hipster.paragraph, photos: [photo1], user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "Philosophy Lesson", price: 2.00, description: Faker::Hipster.paragraph, photos: [photo2], user: seller1, categories: [category2] } )
product3 = Product.create ( {name: "Math lesson", price: 3.00, description: Faker::Hipster.paragraph, photos: [photo3], user: seller1, categories: [category3] } )
product4 = Product.create ( {name: "Ruby Basic", price: 4.00, description: Faker::Hipster.paragraph, photos: [photo4], user: seller1, categories: [category1, category2, category3] } )
product5 = Product.create ( {name: "Html Advance", price: 5.00, description: Faker::Hipster.paragraph, photos: [photo5], user: seller1, categories: [category1, category3] } )
product6 = Product.create ( {name: "How to build a website", price: 6.00, description: Faker::Hipster.paragraph, photos: [photo6], user: seller1, categories: [category1, category2] } )
product7 = Product.create ( {name: "Learn Intenational Business", price: 7.00, description: Faker::Hipster.paragraph, photos: [photo7], user: seller1, categories: [category1, category2, category3] } )
product8 = Product.create ( {name: "Photography Basic", price: 17.00, description: Faker::Hipster.paragraph, photos: [photo8], user: seller1, categories: [category2, category3] } )
product9 = Product.create ( {name: "Photoshop intermediate", price: 1.00, description: Faker::Hipster.paragraph, photos: [photo9], user: seller1, categories: [category1, category2, category3] } )
product10 = Product.create ( {name: "Beginner Illustrator", price: 3.00, description: Faker::Hipster.paragraph, photos: [photo10], user: seller1, categories: [category1, category2] } )
product11 = Product.create ( {name: "How to use Sketch", price: 4.00, description: Faker::Hipster.paragraph, photos: [photo11], user: seller1, categories: [category1, category2, category3] } )
product12 = Product.create ( {name: "Equesion 2nd Level", price: 9.00, description: Faker::Hipster.paragraph, photos: [photo12], user: seller1, categories: [category2, category3] } )

# Create some fake line items
line_item1 = LineItem.create ( {amount: 1, product: product1} )
line_item2 = LineItem.create ( {amount: 2, product: product2} )

# Create a fake order
order1 = Order.create ( { order_number: 1, payment_method: Order::PAYMENT_METHODS[0], user: buyer1, line_items: [line_item1, line_item2] } )
