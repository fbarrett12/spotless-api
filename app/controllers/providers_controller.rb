class ProvidersController < ApplicationController
    def index 
        @providers = Provider.all 
        
    end
end
