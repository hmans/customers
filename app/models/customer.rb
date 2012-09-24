class Customer < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name
end
