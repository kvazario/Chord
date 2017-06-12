class Person < ApplicationRecord

  has_many :encounters, :dependent => :destroy
  belongs_to :company

  def full_name
    first_name+" "+last_name
  end

end
