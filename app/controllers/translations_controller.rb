class TranslationsController < ApplicationController
    def index
        @account=Account.find(params[:account_id])
    end

    def new
        @account = Account.find(params[:account_id])
       @translation = Translation.new 
    end

    def create
        @account = Account.find(params[:account_id])
        @translation = @account.translations.create(translation_params)
        redirect_to account_translations_path(@account.id)
    end

end

private
    def translation_params
       params.require(:translation).permit(:project_name, :source_language, :target_language, :source_text, :target_text)  
    end
