FactoryBot.define do
  factory :address do
    cep { '12345-678' }
    uf { 'SP' }
    city { 'São Paulo' }
  end
end
