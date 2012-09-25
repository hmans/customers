require 'spec_helper'

describe Customer do
  subject do
    Customer.new
  end

  context "when the customer has no first_name and last_name" do
    # it "should have a full_name method returning an empty string" do
    #   subject.full_name.should == ""
    # end

    its(:full_name) { should == "" }
  end

  context "when the customer has first_name and last_name" do
    before do
      subject.first_name = "Manfred"
      subject.last_name = "Mustermann"
    end

    it "should have a full_name method returning the full name" do
      subject.full_name.should == "#{subject.last_name}, #{subject.first_name}"
    end

    # its(:full_name) { should == "#{subject.last_name}, #{subject.first_name}" }
  end
end
