class Customer < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
end
