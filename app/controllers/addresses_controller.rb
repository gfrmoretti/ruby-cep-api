require_relative '../services/address_service'

class AddressesController < ApplicationController
  before_action :authorize_request, :debounce_action

  def find_by_cep_and_save
    cep = params[:cep]
    address = Address.find_by_cep cep

    if address
      unless address.users.find { |u| u[:name] == @current_user[:name] }
        address.users << @current_user

        if address.save
          cache_address cep, address
          render json: address, status: :created
        else
          render json: address.errors, status: :unprocessable_entity
        end
      else
        cache_address cep, address
        render json: address
      end
    else
      address_data = AddressService.find_by_cep(cep)
      address = Address.new(address_data)

      address.users << @current_user

      if address.save
        cache_address cep, address
        render json: address, status: :created
      else
        render json: address.errors, status: :unprocessable_entity
      end
    end
  end

  private

  # Essa parte de cache também pode ser feita utilizando um banco chave valor
  # como o REDIS por exemplo ao invés de ficar somente na memória da aplicação
  def cache_address(cep, address)
    key = "#{@current_user[:name]}:#{cep}"
    Rails.cache.write(key, address.to_json, expires_in: 3600.seconds)
  end

  def debounce_action
    key = "#{@current_user[:name]}:#{params[:cep]}"
    if Rails.cache.exist?(key)
      render json: Rails.cache.read(key), status: :ok
    end
  end
end