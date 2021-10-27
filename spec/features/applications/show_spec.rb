require 'rails_helper'

RSpec.describe 'the shelter show' do
  it "shows the shelter and all it's attributes" do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')
    application.pets << pet
    visit "/applications/#{application.id}"

    expect(page).to have_content(application.address)
    expect(page).to have_content(application.name)
    expect(page).to have_content(application.description)
    expect(page).to have_content(pet.name)
    expect(page).to have_content(application.status)
  end
  it "has a search function if the page is in 'In Progress' status" do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'In Progress')
    application.pets << pet
    visit "/applications/new/#{application.id}"
    fill_in :search, with: 'Scooby'
    click_on "Search"

    expect(current_path).to eq("/applications/new/#{application.id}")
    expect(find_link("Adopt this pet").visible?).to be(true)

  end
end
