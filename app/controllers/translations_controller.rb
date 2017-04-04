class TranslationsController < ApplicationController
    def index
        @account=Account.find(params[:account_id])
    end
    
    def create
        @account=Account.find(params[:account_id])
        
    end
end
