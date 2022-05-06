require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.create(name: 'tom', email: 'tom@tom.com', password: '123456')
  subject { Category.new(user_id: user, name: 'cat1', icon: 'icon.png') }
  before { subject.save }

  describe 'Category model' do
    it 'should have a name' do
      expect(subject.name).not_to be_nil
    end

    it 'should have an icon' do
      expect(subject.icon).not_to be_nil
    end
  end
end
