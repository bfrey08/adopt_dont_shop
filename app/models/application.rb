class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  def address
    self.street + ' ' + self.city + ', ' + self.state + ' ' + self.zip
  end
end
