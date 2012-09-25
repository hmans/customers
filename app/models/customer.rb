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

  def age
    return nil unless birthday.present?

    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end
