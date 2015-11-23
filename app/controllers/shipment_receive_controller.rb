require 'json'
class ShipmentReceiveController < ApplicationController

  def index
    redirect_to :action => 'new'
   end
   
  def new 
    shipment = Shipment.shipment_template
    @basic_parameters = session[:basic_parameters]
    token = session[:token]     
    @shipment = ShipmentReceive.new(shipment, @basic_parameters, token).prepare_shipment_receiving_screen
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
    token = session[:token]
    processed_response = ShipmentReceive.new(deep_copy(@shipment), @basic_parameters, token).process_receiving(params["name"], params["value"])
    session[:shipment] = processed_response[:shipment]
    if processed_response[:status] == '201'
      set_un_palletized_case
    end

    @shipment = session[:shipment]
    @error =   processed_response[:error]
    render 'new.html.erb'
  end

  def set_un_palletized_case

    unpalletized_case = []
    unpalletized_case  =  session[:unpalletized_case].nil? ? [] : session[:unpalletized_case]
    unpalletized_case << get_from_array(@shipment, 'case')
    session[:unpalletized_case] = unpalletized_case
  end

  def set_case_palletize_screen
    @palletize = Shipment.pallatize_template
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

