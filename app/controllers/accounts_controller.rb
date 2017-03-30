class AccountsController < ApplicationController
    def index
    end
    
    def show
        @account = Account.find(params[:id])
    end
    
    def new
       @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        
        if @account.save
            redirect_to @account
        else
            render 'new'
        end
    end
    
    def edit
        @account = Account.find(params[:id])
    end
    
    def update
        @account = Account.find(params[:id]) 
        if @account.update(account_params)
            redirect_to @account
        else
            render 'edit'
        end
    end
    
    def login
    end
end

private
    def account_params
       params.require(:account).permit(:first_name, :last_name, :username, :password)  
    end
