require 'spec_helper'

describe Customer do
  subject do
    Customer.new
  end

  describe '#full_name' do
    context "when the customer has no first_name and last_name" do
      it "should return an empty string" do
        subject.full_name.should == ""
      end
    end

    context "when the curstomer has first_name and last_name" do
      before do
        subject.first_name = "Manfred"
        subject.last_name = "Mustermann"
      end

      it "should return the full name" do
        subject.full_name.should == "#{subject.last_name}, #{subject.first_name}"
      end
    end
  end
end
