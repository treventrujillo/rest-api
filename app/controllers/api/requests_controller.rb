class Api::RequestsController < ApplicationController

  def example_request
    RestClient.get('http://example.com') {|response, request, result, &block| 
      case response.code
        when 200
          puts "Request Successful!"
          response
        when 500
          puts "Internal Server Error!"
          response
        else
          response.return!(&block)
      end
    }
  end

end
