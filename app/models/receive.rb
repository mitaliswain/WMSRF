class Shipment
  def self.shipment_template
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

  def self.pallatize_template
    [
        {"name" => 'pallet',  "description"=> "Pallet ID" ,       "value" => '', "validated" => false, "to_validate" => "true"},
    ]
  end
end