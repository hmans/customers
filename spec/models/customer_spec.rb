require 'spec_helper'

describe Customer do
  subject { customer }
  let(:customer) { Customer.new }

  context "when the customer has no first_name and last_name" do
    its(:full_name) { should == "" }
  end

  context "when the customer has first_name and last_name" do
    before do
      customer.first_name = "Manfred"
      customer.last_name = "Mustermann"
    end

    its(:full_name) { should == "#{customer.last_name}, #{customer.first_name}" }
  end
end
