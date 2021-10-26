require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many(:pets).through(:application_pets)}
  end
  it 'can put together an address' do
    application = Application.create(name: 'Billy', street: 'Downing', city: 'Denver', state: 'CO', zip: '80209', description: 'Great dog owner', status: 'Pending')

    expect(application.address).to eq('Downing Denver, CO 80209')
  end
end
