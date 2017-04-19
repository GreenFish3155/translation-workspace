class AccountsController < ApplicationController
    def show
        @account = Account.find(params[:id])
    end
    
    def new
       @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        
        if @account.save
            redirect_to account_translations_path(@account.id)
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
    
    def destroy
        @account = Account.find(params[:id])
        @translations = Translation.where("account_id = ? ", @account.id)
        
        @account.destroy
        @translations.destroy_all
        
        redirect_to controller: 'welcome'
    end
    
    def login
        @account = Account.where("username= ? ", params[:username]).take
        if !@account.nil?
            if @account.password == params[:field2]
                redirect_to account_translations_path(@account.id)
            else
                redirect_to controller: 'welcome', error: 'Incorrect Username or Password'
            end
        else
            redirect_to controller: 'welcome', error: 'Incorrect Username or Password'
        end
    end
end

private
    def account_params
       params.require(:account).permit(:first_name, :last_name, :username, :password)  
    end
