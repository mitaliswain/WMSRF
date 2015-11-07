class Menu

  def self.basic_parameters(params)
    [ { "name" => 'client', "description"=> "Client", "value" =>params[:client] },
      { "name" => 'warehouse', "description"=> "Warehouse", "value" =>params[:warehouse] } ,
      { "name" => 'building', "description"=> "Building", "value" =>params[:building] } ,
      { "name" => 'channel', "description"=> "Channel", "value" =>params[:channel] } ]
  end

  def self.menu_list
    [{id: 1, description: 'Receive Case', path: '/shipmentreceive/new'},
     {id: 2, description: 'Case Putaway', path: '/case_putaway/new'}]
  end


  end