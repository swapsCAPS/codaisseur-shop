require 'rails_helper'

# home -> log-in ->  profile page-> expect to have "profile.name"
# home -> log-in ->  profile page-> expect to have "email"

describe "signed in" do

  before { sign_in user }

  context "without a profile" do
    let!(:user) { create :user }

    it "shows email" do

      render
      expect(rendered).to have_content(user.email)

    end
  end

  context "with a profile" do
    let!(:user) { create :user }
    let!(:profile) { create :profile, user: user }

    it "shows full_name" do

      render
      expect(rendered).to have_content(user.full_name)
    end
  end
end

describe "signed out" do
  it "shows Log In and Sign Up" do

    render
    expect(rendered).to have_content("Log In")
    expect(rendered).to have_content("Sign Up")
  end
end