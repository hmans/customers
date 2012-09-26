require 'spec_helper'

describe Customer do
  subject { customer }
  let(:customer) { FactoryGirl.build(:customer) }

  context "when the customer has no first_name and last_name" do
    subject { FactoryGirl.build(:blank_customer) }
    its(:full_name) { should == "" }
  end

  context "when the customer has first_name and last_name" do
    its(:full_name) { should == "#{customer.last_name}, #{customer.first_name}" }
  end

  describe 'validations' do
    context 'when valid' do
      it { should be_valid }
    end

    context 'when invalid' do
      subject { FactoryGirl.build(:blank_customer) }
      it { should_not be_valid }
    end

    context 'when only first_name is missing' do
      subject { FactoryGirl.build(:customer, :first_name => nil) }
      it { should_not be_valid }
    end

    describe 'email attribute' do
      context 'when another customer with the same email address already exists in the database' do
        before { FactoryGirl.create(:customer, :email => subject.email) }
        it { should_not be_valid }
      end
    end
  end

  describe 'the #age method' do
    context "when birthday is available" do
      subject { FactoryGirl.build(:customer_with_birthday, :birthday => (32 * 12 + 4).months.ago) }
      its(:age) { should == 32 }
    end

    context "when birthday is not available" do
      subject { FactoryGirl.build(:customer, :birthday => nil) }
      its(:age) { should be_nil }
    end
  end
end
