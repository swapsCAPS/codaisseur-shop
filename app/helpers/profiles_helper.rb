module ProfilesHelper

  def profile_photo profile
    if profile.photo
      image_tag profile.photo, class: "img-responsive"
    else
      image_tag "http://res.cloudinary.com/dgmqizxd0/image/upload/v1476977556/Incognito_Search_Large_Logo_tz.jpg", class: "img-responsive"
    end
  end
end
