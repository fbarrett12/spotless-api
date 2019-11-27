class ProvidersController < ApplicationController
    def index 
        @providers = Provider.all  
        render json: ProviderSerializer.new(@providers).serialized_json
    end

    
end
