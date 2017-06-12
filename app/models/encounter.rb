class Encounter < ApplicationRecord

  belongs_to :person
  belongs_to :event, :required => false
  has_one :company, :through => :person, :source => :company

  validates :person_id, :presence=> true


end
