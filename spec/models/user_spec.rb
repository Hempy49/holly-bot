require 'rails_helper'

RSpec.describe User, type: :model do
  it "a valid user is saved in db" do
    user = User.new
    user.email = "simon@mail.com"
    user.password = "password123"
    user.save
    expect(user).to be_valid
  end
end
