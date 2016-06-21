require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  # Shoulda tests for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(5) }
  it { should allow_value("user@bloccit.com").for(:email) }

  # Shoulda tests for password
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have email attribute" do
      expect(user).to have_attributes(email: user.email)
    end
  end
end
