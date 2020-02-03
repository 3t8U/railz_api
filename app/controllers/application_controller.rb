class ApplicationController < ActionController::API
 before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
  json_response({ message: exception.message }, :not_found)
  end
  include Response

end
