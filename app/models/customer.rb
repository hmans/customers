class Customer < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  def full_name
    if last_name.present? && first_name.present?
      "#{last_name}, #{first_name}"
    else
      ""
    end
  end
end
