class ProvidersController < ApplicationController
    def index 
        @providers = Provider.all  
        render json: ProviderSerializer.new(@providers).serialized_json
    end

    def show 
        @provider = Provider.find(params(:id))
        render json: @provider 
    end

    
end
