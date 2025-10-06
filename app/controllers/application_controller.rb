class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)

    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
    else
      render json: { error: "Não autorizado" }, status: :unauthorized
    end
  end
end
