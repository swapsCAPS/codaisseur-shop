require 'rails_helper'

# home -> log-in ->  profile page-> expect to have "profile.name"
# home -> log-in ->  profile page-> expect to have "email"

describe "signed in" do

  before { login_as user }

  let!(:user) { create :user }

  it "has email" do

    render
    expect(rendered).to have_content(user.email)

  end
end

describe "signed in and has profile" do

  before { login_as user }
  let!(:user) { create :user }
  let!(:profile) { create :profile, user: user }

  it "has full_name" do

    visit categories_url
    expect(page).to have_content(user.full_name)
  end
end

describe "NOT signed in" do
  it "has Log In and Sign Up" do
    visit categories_url

    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")
  end
end