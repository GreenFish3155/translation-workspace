class SharedProjectsController < ApplicationController
    def create
        @account = Account.where("username= ? ", params[:username]).take
        if !@account.nil?
            @sharedproject = @account.shared_projects.create(shared_projects_params)
        end
        redirect_to account_translation_path(params[:account_id], params[:translation_id])
    end
end

private
    def shared_projects_params
       params.require(:sharedproject).permit(@account.id, params[:translation_id])  
    end