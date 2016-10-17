require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "#by_letter" do

    let(:user) { create :user }
    let(:user2) { create :user }

    let(:profile1) { create :profile, first_name: "Sander", user: user }
    let(:profile2) { create :profile, first_name: "Stefan", user: user }
    let(:profile3) { create :profile, first_name: "Wouter", user: user }

    let(:profile4) { create :profile, first_name: "pipo", user: user }

    context "profile has a user" do
      it "only returns a user" do
        expect(profile4.user).to eq(user)
      end
    end
  end
end
