require 'spec_helper'

describe "Creating a customer" do
  it "should successfully create a customer" do
    # remember the customer count for later
    count = Customer.count

    # start at the customers index page
    visit '/customers'

    # navigate to the new customer form
    click_link 'New Customer'
    page.should have_selector('h1', :text => 'New customer')

    # fill and submit the form
    fill_in 'First name', :with => "Manfred"
    fill_in 'Last name', :with => "Mustermann"
    fill_in 'Email', :with => "manfred@mustermann.de"
    click_button "Create Customer"

    # test if the customer was created successfully
    Customer.count.should == count + 1
    customer = Customer.last
    customer.last_name.should == "Mustermann"
    customer.first_name.should == "Manfred"
    customer.email.should == "manfred@mustermann.de"
  end
end
