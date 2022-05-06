require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'should test model validations' do
    @user = User.create(name: 'tom', email: 'tim@tim.com', password: '123456')
    @category = Category.create(user_id: @user, name: 'cat1', icon: 'icon.png')

    subject do
      Purchase.new(name: 'purchase1', amount: 20, author_id: @user, category_id: @category)
    end
    before { subject.save }

    describe 'Purchase model' do
      it 'should have a name' do
        expect(subject.name).not_to be_nil
      end

      it 'should check that the name is not blank' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'should have an amount' do
        expect(subject.amount).not_to be_nil
        expect(subject.amount).to be_a(Float)
        expect(subject.amount).to be > 0
      end
    end
  end
end
