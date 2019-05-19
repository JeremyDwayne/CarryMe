require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: "test@crry.me", password: "somepassword", password_confirmation: "somepassword") }
  it "is valid with valid attributes"
  it "is not valid without an email"
  it "is not valid without a password"
end
