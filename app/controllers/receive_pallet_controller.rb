class ReceivePalletController < ApplicationController
  def index
    redirect_to :action => 'new'
  end

  def new
    @shipment = Template.pallet_receive_template
    @basic_parameters = session[:basic_parameters]
    token = session[:token]
    @shipment = CaseReceive.new(@shipment, @basic_parameters, token).prepare_shipment_receiving_screen
    session[:shipment] = @shipment
    @error = ''
  end

  def create
   pallet_receive
  end

  def pallet_receive
    @basic_parameters = session[:basic_parameters]
    @shipment = session[:shipment]
    token = session[:token]
    processed_response = CaseReceive.new(@shipment, @basic_parameters, token).process_receiving(params["name"], params["value"])
    session[:shipment] = processed_response[:shipment]
    @shipment = session[:shipment]
    @error =   processed_response[:error]
    render 'new.html.erb'
  end
end
