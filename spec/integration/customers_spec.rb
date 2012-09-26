require 'spec_helper'

describe "Creating a customer", :js => true do
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

describe "Updating a customer" do
  it "should modify the customer in the database" do
    # create some customers
    10.times { FactoryGirl.create(:customer) }

    # pick a random customer
    customer = Customer.all.shuffle.first

    # head to the customers index page
    visit '/customers'

    # find the correct 'edit' link
    within row_for_customer(customer) do
      click_link "Edit"
    end

    # test that we're on the correct editing page
    page.should have_selector('h1', :text => 'Editing customer')
    find_field('First name').value.should == customer.first_name

    # update the customer
    fill_in "First name", :with => "Detlef"
    click_button "Update Customer"

    # check customer in the database
    customer.reload
    customer.first_name.should == "Detlef"
  end
end
