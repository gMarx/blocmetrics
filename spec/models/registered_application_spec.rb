require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { create(:user) }
  let(:registered_application) { create(:registered_application) }

  # Shoulda tests for email
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(4) }
  it { should allow_value("Grand Adventure").for(:name) }

  # validate user.id

  # Shoulda tests for password
  it { should validate_presence_of(:url) }
  it { should validate_length_of(:url).is_at_least(12) }
  it { should allow_value('http//www.grandadventure.com').for(:url) }

  # describe "attributes" do
  #   it "should have email attribute" do
  #     expect(user).to have_attributes(email: user.email)
  #   end
  # end

end
