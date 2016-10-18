require 'rails_helper'

# home -> log-in ->  profile page-> expect to have "profile.name"
# home -> log-in ->  profile page-> expect to have "email"

describe "" do

  let(:user) { create :user }
  before { login_as user }

  it do

    visit categories_urlgc

  end

  it do

  end

end