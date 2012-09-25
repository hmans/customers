require 'spec_helper'

describe Customer do
  before do
    @customer = Customer.new
  end

  describe '#full_name' do
    context "without first_name and last_name" do
      it "should return an empty string" do
        @customer.full_name.should == ""
      end
    end

    context "with first_name and last_name" do
      before do
        @customer.first_name = "Manfred"
        @customer.last_name = "Mustermann"
      end

      it "should return the full name" do
        @customer.full_name.should == "#{@customer.last_name}, #{@customer.first_name}"
      end
    end
  end
end
