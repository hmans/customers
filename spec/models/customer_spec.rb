require 'spec_helper'

describe Customer do
  subject { normal_customer }
  let(:blank_customer) { Customer.new }

  let(:normal_customer) do
    Customer.new(
      :first_name => first_name, :last_name => last_name,
      :email => email, :birthday => birthday)
  end

  let(:birthday)   { nil }
  let(:first_name) { "Manfred" }
  let(:last_name)  { "Mustermann" }
  let(:email)      { "manfred@mustermann.de" }

  context "when the customer has no first_name and last_name" do
    subject { blank_customer }
    its(:full_name) { should == "" }
  end

  context "when the customer has first_name and last_name" do
    its(:full_name) { should == "#{normal_customer.last_name}, #{normal_customer.first_name}" }
  end

  describe 'validations' do
    context 'when valid' do
      it { should be_valid }
    end

    context 'when invalid' do
      subject { blank_customer }
      it { should_not be_valid }
    end

    context 'when only first_name is missing' do
      let(:first_name) { nil }
      it { should_not be_valid }
    end

    describe 'email attribute' do
      context 'when another customer with the same email address already exists in the database' do
        before { Customer.create!(:first_name => "Hans", :last_name => "Peter", :email => subject.email) }
        it { should_not be_valid }
      end
    end
  end

  describe 'the #age method' do
    context "when birthday is available" do
      let(:birthday) { (32 * 12 + 4).months.ago }
      its(:age) { should == 32 }
    end

    context "when birthday is not available" do
      let(:birthday) { nil }
      its(:age) { should be_nil }
    end
  end
end
