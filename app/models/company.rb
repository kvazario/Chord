class Company < ApplicationRecord

  has_many :people, :dependent => :nullify
  has_many :encounters, :through => :people, :source => :encounters

  validates :company_name, :presence=> true, :uniqueness => true

end
