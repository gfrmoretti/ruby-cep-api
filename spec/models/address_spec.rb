require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    address = Address.new(cep: '12345-678', uf: 'SP', city: 'São Paulo')
    expect(address).to be_valid
  end

  it 'is not valid without a cep' do
    address = Address.new(cep: nil, uf: 'SP', city: 'São Paulo')
    expect(address).not_to be_valid
  end

  it 'is not valid without a uf' do
    address = Address.new(cep: '12345-678', uf: nil, city: 'São Paulo')
    expect(address).not_to be_valid
  end

  it 'is not valid without a city' do
    address = Address.new(cep: '12345-678', uf: 'SP', city: nil)
    expect(address).not_to be_valid
  end

  it 'is valid without a neighborhood' do
    address = Address.new(cep: '12345-678', uf: 'SP', city: 'São Paulo', neighborhood: nil)
    expect(address).to be_valid
  end

  it 'is valid without a street' do
    address = Address.new(cep: '12345-678', uf: 'SP', city: 'São Paulo', street: nil)
    expect(address).to be_valid
  end
end
