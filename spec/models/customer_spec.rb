require 'spec_helper'

describe Customer do
  subject { customer }
  let(:customer) { Customer.new }

  context "when the customer has no first_name and last_name" do
    let(:customer) { Customer.new(:first_name => nil, :last_name => nil) }

    its(:full_name) { should == "" }
  end

  context "when the customer has first_name and last_name" do
    let(:customer) { Customer.new(:first_name => "Manfred", :last_name => "Mustermann") }

    its(:full_name) { should == "#{customer.last_name}, #{customer.first_name}" }
  end
end
