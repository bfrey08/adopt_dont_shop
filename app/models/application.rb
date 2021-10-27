class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  def address
    self.street + ' ' + self.city + ', ' + self.state + ' ' + self.zip
  end

  def search_pet(search)
    if search != nil
      pet_search = search.downcase
      pet_search[0] = pet_search[0].upcase!
      return Pet.find_by('name LIKE ?', "%#{pet_search}%")
    end
  end

  def add_pet(add, pet_adopt)
    if add == 'yes'
      pet_adopt = pet_adopt
      pet_adopt[0] = pet_adopt[0].upcase
      @pet = Pet.find_by(name: pet_adopt)
      self.pets << @pet
    end
  end

  def is_pets?
    if self.pets.count >= 1
      @can_submit = true
    else
      @can_submit = false
    end
  end
end
