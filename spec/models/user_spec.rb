require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(
      first_name: "Anything",
      last_name: "Anything",
      email: "anything@jungle.com",
      password: 'Jungle',
      password_confirmation: 'Jungle'
    )}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  # RSPEC NOT CASE FIRST NAME
  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  # RSPEC NOT CASE LAST NAME
  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  # RSPEC PASSWORD
  it "is not valid without a password" do
    subject.password_confirmation = 'Jngle'
    expect(subject.password).to_not eq(subject.password_confirmation)
  end

  # RSPEC NOT CASE SENSITIVE EMAIL
  it "is not valid without a email" do
    User.create(
      first_name: "Anything",
      last_name: "Anything",
      email: "anything@jungle.com",
      password: 'Jungle',
      password_confirmation: 'Jungle'
    )
    subject.email = 'anything@jungle.COM'
    expect(subject).to_not be_valid
  end

  # RSPEC PASSWORD LENGTH
  it "is not valid without a necessary length password" do
    subject.password = 'angle'
    subject.password_confirmation = 'angle'
    expect(subject).to_not be_valid
  end

  # RSPEC AUTHENTICATE WITH CREDENTIALS
  describe '.authenticate_with_credentials' do
    it "is not valid authenticate_with_credentials with wrong password" do
      user = User.create(
        first_name: "Anything",
        last_name: "Anything",
        email: "anything@jungle.com",
        password: 'Jungle',
        password_confirmation: 'Jungle'
      )
      expect(user.authenticate_with_credentials('anything@jungle.com', 'angle')).to_not be User
    end
  end

  # RSPEC AUTHENTICATE WITH CREDENTIALS - EMAIL BLANKSPACES
  describe '.authenticate_with_credentials' do
    it "is valid authenticate_with_credentials with email blackspaces" do
      user = User.create(
        first_name: "Anything",
        last_name: "Anything",
        email: "test@jungle.com",
        password: 'Jungle',
        password_confirmation: 'Jungle'
      )
      expect(user.authenticate_with_credentials('   test@jungle.com   ', 'Jungle')).to be User
    end
  end

end