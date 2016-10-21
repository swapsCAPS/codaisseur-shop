# First remove all existing entries from our database

Photo.delete_all

LineItem.delete_all       # this is important!
Order.delete_all          # this is important!

Category.delete_all
Product.delete_all

Profile.delete_all
User.delete_all

# Copied from bnb. Does this work properly?
ActiveRecord::Base.connection.execute("DELETE  from categories_products")


# Create some users
buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Pim", email: "pim@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Miriam", email: "miriam@gmail.com", role: "seller", password: "abcd1234"} )

#Create profiles

profile1 = Profile.create({first_name:"Miriam", last_name:"Tocino", bio:"Every time you make a typo, the errorists win.", user: seller1})
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
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/pvdh/image/upload/c_scale,w_821/v1476894824/bigstock-Designer-Drawing-Website-Devel-51932833_hwttbo.jpg")
photo7 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/v1476440739/download_k2bjie.png")
photo8 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/v1476440739/download_myywvs.jpg")
photo9 = Photo.create(remote_image_url: "https://res-3.cloudinary.com/pvdh/image/upload/v1476440759/good-study-habits_rdr4lx.png")
photo10 = Photo.create(remote_image_url: "https://res-2.cloudinary.com/pvdh/image/upload/c_scale,h_350,w_350/v1476440749/crop380w_istock_000002193842xsmall-books_jil6v3.jpg")
photo11 = Photo.create(remote_image_url: "https://res-1.cloudinary.com/pvdh/image/upload/v1476440741/images_2_mpmrpw.jpg")
photo12 = Photo.create(remote_image_url: "https://res-4.cloudinary.com/pvdh/image/upload/v1476440740/download_2_qtqoqq.jpg")

# Create some products
product1 = Product.create ( {name: "Dutch Lesson", price: 1.00, description: Faker::Hipster.paragraph, photos: [photo1], user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "How to study Lesson", price: 2.00, description: Faker::Hipster.paragraph, photos: [photo2], user: seller1, categories: [category2] } )
product3 = Product.create ( {name: "Rails for beginners Lesson", price: 3.00, description: Faker::Hipster.paragraph, photos: [photo3], user: seller1, categories: [category3] } )
product4 = Product.create ( {name: "Ruby Basics", price: 4.00, description: Faker::Hipster.paragraph, photos: [photo4], user: seller1, categories: [category1, category2, category3] } )
product5 = Product.create ( {name: "Html Advanced Lesson", price: 5.00, description: Faker::Hipster.paragraph, photos: [photo5], user: seller1, categories: [category1, category3] } )
product6 = Product.create ( {name: "How to build a website Basics", price: 6.00, description: "You have a problem. Admit it. You don't know how to make a website. You want to be able to make a website in a day for a client. You want that client to be smiling. I know how to make a websites. That's why I've made this course. Just for you. You will learn: how to build a website. Order today and you'll be on your way to become an awesome programmer!", photos: [photo6], user: seller1, categories: [category1, category2] } )
product7 = Product.create ( {name: "Learn Rspec Basics", price: 7.00, description: Faker::Hipster.paragraph, photos: [photo7], user: seller1, categories: [category1, category2, category3] } )
product8 = Product.create ( {name: "Photography Intermediate & Advanced", price: 17.00, description: Faker::Hipster.paragraph, photos: [photo8], user: seller1, categories: [category2, category3] } )
product9 = Product.create ( {name: "JavaScript from zero to hero", price: 1.00, description: Faker::Hipster.paragraph, photos: [photo9], user: seller1, categories: [category1, category2, category3] } )
product10 = Product.create ( {name: "Illustrator Basics & Intermediate", price: 3.00, description: Faker::Hipster.paragraph, photos: [photo10], user: seller1, categories: [category1, category2] } )
product11 = Product.create ( {name: "How to use Sketch", price: 4.00, description: Faker::Hipster.paragraph, photos: [photo11], user: seller1, categories: [category1, category2, category3] } )
product12 = Product.create ( {name: "Ruby intermediate & Advanced", price: 9.00, description: Faker::Hipster.paragraph, photos: [photo12], user: seller1, categories: [category2, category3] } )

# Create some fake line items
line_item1 = LineItem.create ( {amount: 1, product: product1} )
line_item2 = LineItem.create ( {amount: 2, product: product2} )

# Create a fake order
order1 = Order.create ( { order_number: 1, payment_method: Order::PAYMENT_METHODS[0], user: buyer1, line_items: [line_item1, line_item2] } )
