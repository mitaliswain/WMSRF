class MainMenuController < ApplicationController
  def new
    @basic_parameters = Menu.basic_parameters(params)
  end

  def create
    session[:basic_parameters] = {client: params[:client], warehouse: params[:warehouse], 
                                  building: params[:building], channel: params[:channel]}

    redirect_to '/main_menu/menu_list'
  end

  def menu_list
    p 'here'
    @menu_list = Menu.menu_list
  end

  def menu_list_option
    menu = Menu.menu_list.select {|menu| menu[:id] == params[:option].to_i}.first
    menu ? (redirect_to menu[:path]) : (redirect_to action: "menu_list")

  end

  
end
