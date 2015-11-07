class CasePutawayController < ApplicationController

  def index
    redirect_to :action => 'new'
  end

  def new
    putaway =   [
        {"name" => 'case_id',           "description"=> "Case" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
        {"name" => 'location',       "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "Yes"}
    ]
    @basic_parameters = session[:basic_parameters]
    token = session[:token]
    @putaway = CasePutaway.new(putaway, @basic_parameters, token).prepare_putaway_receiving_screen
    session[:putaway] = @putaway
    @error = ''
  end

  def create
    token = session[:token]
    @basic_parameters = session[:basic_parameters]
    @putaway = session[:putaway]
    processed_response = CasePutaway.new(@putaway, @basic_parameters, token).process_putaway(params["name"], params["value"])
    session[:putaway] = processed_response[:putaway]
    @error =   processed_response[:error]
    render 'new.html.erb'

  end

end