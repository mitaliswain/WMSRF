require 'json'
class ShipmentReceiveController < ApplicationController

  def index
    redirect_to :action => 'new'
   end
   
  def new 
    shipment =   [
                  {"name" => 'location',           "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'shipment_nbr',       "description"=> "Shipment" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'purchase_order_nbr', "description"=> "Purchase Order" , "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'case',               "description"=> "Case",            "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'lot_number',         "description"=> "Lot Number",      "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'coo',                "description"=> "coo",             "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'item',               "description"=> "Item" ,           "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'quantity',           "description"=> "Quantity",        "value" => '', "validated" => false, "to_validate" => "Yes"},
                  {"name" => 'serial_nbr',         "description"=> "serial Number",   "value" => '', "validated" => false, "to_validate" => "Yes", "temp_data"=>[]},
                  {"name" => 'inner_pack',         "description"=> "Inner Pack",      "value" => '', "validated" => false ,"to_validate" => "Yes" }
                ]
    @basic_parameters = session[:basic_parameters]        
    @shipment = ShipmentReceive.new(shipment, @basic_parameters).prepare_shipment_receiving_screen
    session[:shipment] = @shipment  
      @error = ''            
  end 
  
  def create
    if params["commit"] == 'Receive'
      @basic_parameters = session[:basic_parameters]
      @shipment = session[:shipment]
      processed_response = ShipmentReceive.new(@shipment, @basic_parameters).process_receiving(params["name"], params["value"])
      session[:shipment] = processed_response[:shipment]
      @error =   processed_response[:error]
      render 'new.html.erb'
    else
      palletize
    end
  end

  def palletize
    palletize =   [
        {"name" => 'pallet',           "description"=> "Pallet ID" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
    ]
    @basic_parameters = session[:basic_parameters]
    @palletize = ShipmentReceive.new(palletize, @basic_parameters).palletize
    session[:shipment] = @shipment
    @error = ''
    render 'palletize.html.erb'
  end
end

