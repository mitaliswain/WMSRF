class MainMenuController < ApplicationController
  def new
    #@basic_parameters = Menu.basic_parameters(params, JsonWebToken::JsonWebToken.decode(session[:token]))
  #rescue Exception=> error
    render json: {a: JsonWebToken::JsonWebToken.decode(session[:token])}
  end

  def create
    session[:basic_parameters] = {client: params[:client], warehouse: params[:warehouse], 
                                  building: params[:building], channel: params[:channel]}

    redirect_to '/main_menu/menu_list'
  end

  def menu_list
    @menu_list = Menu.menu_list
  end

  def menu_list_option
    menu = Menu.menu_list.select {|menu| menu[:id] == params[:option].to_i}.first
    menu ? (redirect_to menu[:path]) : (redirect_to action: "menu_list")

  end

  
end
