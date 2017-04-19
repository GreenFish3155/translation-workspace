class TranslationsController < ApplicationController
    def index
        @account=Account.find(params[:account_id])
        @translations = Translation.where("account_id = ? ", @account.id)
    end

    def new
        @account = Account.find(params[:account_id])
       @translation = Translation.new 
    end

    def create
        @account = Account.find(params[:account_id])
        @translation = @account.translations.create(translation_params)
        redirect_to account_translation_path(@account.id, @translation.id)
    end
    
    def show
        @account = Account.find(params[:account_id])
        @translation = Translation.find(params[:id])
    end
    
    def edit
       @account = Account.find(params[:account_id]) 
       @translation = Translation.find(params[:id])
    end
    
    def update
        @account = Account.find(params[:account_id])
        @translation = Translation.find(params[:id]) 
        if @translation.update(translation_params)
            redirect_to account_translation_path(@account.id, @translation.id)
        else
            render 'edit'
        end 
    end
    
    def destroy
       @translation = Translation.find(params[:id])
       @translation.destroy
       
       redirect_to account_translations_path(params[:account_id])
    end

end

private
    def translation_params
       params.require(:translation).permit(:project_name, :source_language, :target_language, :source_text, :target_text)  
    end
