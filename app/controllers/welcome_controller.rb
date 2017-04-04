class WelcomeController < ApplicationController
  def index
    @error=params[:error]
  end
end
