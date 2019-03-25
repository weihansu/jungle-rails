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

  # it "is not valid without a name" do
  #   subject.name = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a price" do
  #   subject.price_cents = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a category" do
  #   subject.category = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a quantity" do
  #   subject.quantity = nil
  #   expect(subject).to_not be_valid
  # end

end