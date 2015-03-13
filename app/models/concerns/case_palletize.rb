require 'rest_client'

class CasePalletize
  attr_accessor :unpalletized_case, :basic_parameters, :config_list, :pallet_id

  def initialize(basic_parameters, pallet_id, unpalletized_case)
    @unpalletized_case = unpalletized_case
    @pallet_id = pallet_id
    @basic_parameters = basic_parameters
  end

  def palletize

    url = Properties.getUrl + '/case/' + pallet_id + '/palletize'


    response = RestClient.post(url, app_parameters: basic_parameters, cases_to_be_palletized: unpalletized_case){ | responses, request, result, &block |
      case responses.code
        when 200, 201, 422, 204
          responses
        else
          message = responses.nil? ? {} : JSON.parse(responses)["message"]
          {status: responses.code, message: message}.to_json
      end
    }
    return JSON.parse(response)


  end
end