class Event < ApplicationRecord

  has_many :encounters, :dependent => :nullify

  validates :event_name, :presence=> true
  validates_date :date, :on_or_before => lambda { Date.current }

  def display_name
    event_name+" "+date.to_s
  end

end
