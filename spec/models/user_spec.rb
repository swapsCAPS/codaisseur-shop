require 'rails_helper'

RSpec.describe User, type: :model do

# copied from codaisseur bnb
  describe "create user" do
    let(:user) { create :user }

    it "has name and email key" do

      expect(user.errors).not_to have_key(:name)
      expect(user.errors).not_to have_key(:email)
    end
  end

end
