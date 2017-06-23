require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) {FactoryGirl.build (:user)}

  describe "validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_uniqueness_of(:session_token)}
    it { should validate_uniqueness_of(:username)}
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "asssociations" do
    it { should have_many (:goals) }
    it { should have_many (:user_comments) }
  end

  describe "::find_by_credentials" do

    before { user.save! }
    subject(:wrong_user) {FactoryGirl.build (:wrong_user)}

    it "should find user by credentials" do
      expect(User.find_by_credentials(user.username,user.password)).to eq(user)
    end

    it "should return nil if can't find user and/or password" do
      expect(User.find_by_credentials(wrong_user.username,wrong_user.password)).to eq(nil)
    end
  end
end
