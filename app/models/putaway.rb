class Putaway

  def self.putaway_template
    [
        {"name" => 'case_id',           "description"=> "Case" ,       "value" => '', "validated" => false, "to_validate" => "Yes"},
        {"name" => 'location',       "description"=> "Location" ,       "value" => '', "validated" => false, "to_validate" => "Yes"}
    ]
  end

end