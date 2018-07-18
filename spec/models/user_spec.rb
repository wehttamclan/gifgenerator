require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should have_secure_password }
    it { should have_many(:favorites) }
  end
  describe 'roles' do
    it "can be created as a default user" do
      user = User.create(username: 'ian', password: ";lkj", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
    it 'can be created as an admin' do
      user = User.create(username: 'bob', password: 'asdf', role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end
