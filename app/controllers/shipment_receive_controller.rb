require 'json'
class ShipmentReceiveController < ApplicationController

  def index
    redirect_to :action => 'new'
   end
   
  def new 
    shipment =   [
                  {"name" => 'location',           "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'shipment_nbr',       "description"=> "Shipment" ,       "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'purchase_order_nbr', "description"=> "Purchase Order" , "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'case',               "description"=> "Case",            "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'lot_number',         "description"=> "Lot Number",      "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'coo',                "description"=> "Coo",             "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'item',               "description"=> "Item" ,           "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'quantity',           "description"=> "Quantity",        "value" => '', "validated" => false, "to_validate" => "true"},
                  {"name" => 'serial_nbr',         "description"=> "Serial Number",   "value" => '', "validated" => false, "to_validate" => "true", "temp_data"=>[]},
                  {"name" => 'inner_pack',         "description"=> "Inner Pack",      "value" => '', "validated" => false ,"to_validate" => "true" }
                ]
    @basic_parameters = session[:basic_parameters]        
    @shipment = ShipmentReceive.new(shipment, @basic_parameters).prepare_shipment_receiving_screen
    session[:shipment] = @shipment
    @error = ''
  end 
  
  def create
    case params["commit"]
      when  'Receive'
        shipment_receive
      when 'Palletize'
        set_case_palletize_screen
      when 'Process Pallet'
        process_palletize

    end
  end

  def shipment_receive
    @basic_parameters = session[:basic_parameters]
    @shipment = session[:shipment]

    processed_response = ShipmentReceive.new(deep_copy(@shipment), @basic_parameters).process_receiving(params["name"], params["value"])
    session[:shipment] = processed_response[:shipment]
    if processed_response[:status] == '201'
      set_unpalletized_case
    end

    @shipment = session[:shipment]
    @error =   processed_response[:error]
    render 'new.html.erb'
  end

  def set_unpalletized_case

    unpalletized_case = []
    unpalletized_case  =  session[:unpalletized_case].nil? ? [] : session[:unpalletized_case]
    unpalletized_case << get_from_array(@shipment, 'case')
    session[:unpalletized_case] = unpalletized_case
  end

  def set_case_palletize_screen
    @palletize =   [
        {"name" => 'pallet',  "description"=> "Pallet ID" ,       "value" => '', "validated" => false, "to_validate" => "true"},
      ]
    @basic_parameters = session[:basic_parameters]
    render 'palletize.html.erb'
  end

  def process_palletize

    pallet_id = params[:value]
    @basic_parameters = session[:basic_parameters]
    unpalletized_case = session[:unpalletized_case]

    response = CasePalletize.new(@basic_parameters, pallet_id, unpalletized_case).palletize

    session[:unpalletized_case] = []
    @shipment = session[:shipment]
    @error = ''
    render 'new.html.erb'
  end

  def get_from_array(array, argument)
    value = array.select { |element| element["name"] == argument}[0]
    value.nil? ? nil : value["value"]
  end

  def deep_copy(from)
    to = Marshal.load(Marshal.dump(from))
  end
end

