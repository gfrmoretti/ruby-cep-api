class AddressService
  def self.find_by_cep(cep)
    cep_api_uri = ENV['CEP_API_URI']
    uri = URI("#{cep_api_uri}/#{cep}")

    https = Net::HTTP.new(uri.host.to_s, uri.port)

    request = Net::HTTP::Get.new(uri, {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    })

    response = https.request(request)
    address_body = JSON.parse response.read_body
    return {
      cep: address_body['cep'],
      uf: address_body['uf'],
      city: address_body['cidade'],
      neighborhood: address_body['bairro'],
      street: address_body['logradouro']
    }
  end
end
