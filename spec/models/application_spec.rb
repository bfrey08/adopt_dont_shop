require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many(:pets).through(:application_pets)}
  end
  it 'can put together an address' do
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')

    expect(application.address).to eq('Downing Denver, CO 80209')
  end
  it 'can search for pets' do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')
    application.pets << pet
    expect(application.search_pet('scooby')).to eq(pet)
  end
  it 'can add a pet' do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')

    application.add_pet('yes', 'Scooby')

    expect(application.pets).to eq([pet])

  end
  it 'can tell if there are 1 or more pets' do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')

    expect(application.is_pets?).to be(false)
    application.pets << pet
    expect(application.is_pets?).to be(true)
  end
end
