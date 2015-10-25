class LoginController < ApplicationController

  def index
  end

  def create
    message=Login.new.login(params[:client], params[:userid], params[:password])

    if message["status"] == "200"
      session[:token] = message["additional_info"][0]["token"]
      redirect_to '/mainmenu/new' 
    else
      render 'index.html.erb'
    end
    
  end

end