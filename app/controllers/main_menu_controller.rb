class MainMenuController < ApplicationController
  def new
    @basic_parameters = [ { "name" => 'client', "description"=> "Client", "value" =>params[:client] },
                      { "name" => 'warehouse', "description"=> "Warehouse", "value" =>params[:warehouse] } ,    
                      { "name" => 'building', "description"=> "Building", "value" =>params[:building] } ,    
                      { "name" => 'channel', "description"=> "Channel", "value" =>params[:channel] } ]     
                                                        p session[:token]   
  end

  def create
    session[:basic_parameters] = {client: params[:client], warehouse: params[:warehouse], 
                                  building: params[:building], channel: params[:channel]}

    redirect_to '/shipmentreceive/new' 
  end
  
  
end
