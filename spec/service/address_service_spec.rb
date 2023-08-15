require 'rails_helper'
require 'address_service'
require 'webmock/rspec'

RSpec.describe AddressService, type: :service do
  describe '.find_by_cep' do
    let(:cep) { '12345-678' }
    let(:valid_response_body) do
      {
        'cep' => '12345-678',
        'uf' => 'SP',
        'cidade' => 'São Paulo',
        'bairro' => 'Centro',
        'logradouro' => 'Rua Principal'
      }
    end
    let(:invalid_response_body) do
      {
        'error' => 'CEP not found'
      }
    end
    let(:response) { double('response', read_body: valid_response_body.to_json) }
    let(:http) { double('http', request: response) }

    before do
      allow(Net::HTTP).to receive(:new).and_return(http)
    end

    it 'fetches address details by cep' do
      expect(http).to receive(:request)
      expect(JSON).to receive(:parse).with(response.read_body).and_return(valid_response_body)

      result = AddressService.find_by_cep(cep)

      expect(result[:cep]).to eq('12345-678')
      expect(result[:uf]).to eq('SP')
      expect(result[:city]).to eq('São Paulo')
      expect(result[:neighborhood]).to eq('Centro')
      expect(result[:street]).to eq('Rua Principal')
    end

    it 'handles HTTP request exception' do
      allow(Net::HTTP).to receive(:new).and_raise(StandardError.new('Request error'))

      expect {
        AddressService.find_by_cep(cep)
      }.to raise_error(StandardError, 'Request error')
    end
  end
end
