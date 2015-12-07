class Template
  def self.case_receive_template
    [
        {"name" => 'location',           "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'shipment_nbr',       "description"=> "Shipment" ,       "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'purchase_order_nbr', "description"=> "Purchase Order" , "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'case',               "description"=> "Case",            "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'item',               "description"=> "Item" ,           "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'quantity',           "description"=> "Quantity",        "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'inner_pack',         "description"=> "Inner Pack",      "value" => '', "validated" => false ,"to_validate" => "true" },
        {"name" => 'coo',                "description"=> "Coo",             "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'lot_number',         "description"=> "Lot Number",      "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'serial_nbr',         "description"=> "Serial Number",   "value" => '', "validated" => false, "to_validate" => "true", "temp_data"=>[]},
    ]
  end

  def self.pallet_receive_template
    [
        {"name" => 'receiving_type',     "description"=> "Receiving Type" , "value" => 'Pallet', "validated" => true,  "to_validate" => "false"},
        {"name" => 'shipment_nbr',       "description"=> "Shipment" ,       "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'location',           "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'pallet',             "description"=> "Pallet ID" ,      "value" => '', "validated" => false, "to_validate" => "true"},
        {"name" => 'inner_pack',         "description"=> "Inner Pack",      "value" => '', "validated" => false ,"to_validate" => "true" }

    ]
  end

  def self.pallatize_template
    [
        {"name" => 'pallet',  "description"=> "Pallet ID" ,       "value" => '', "validated" => false, "to_validate" => "true"},
    ]
  end


  def self.putaway_template
    [
        {"name" => 'case_id',           "description"=> "Case" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
        {"name" => 'location',       "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "Yes"}
    ]
  end


  def self.basic_parameters(params, token)
    [ { "name" => 'client', "description"=> "Client", "value" =>params[:client] || token["client"] },
      { "name" => 'warehouse', "description"=> "Warehouse", "value" =>params[:warehouse] || token["preferred_warehouse"] } ,
      { "name" => 'building', "description"=> "Building", "value" =>params[:building] } ,
      { "name" => 'channel', "description"=> "Channel", "value" =>params[:channel] } ]
  end

end