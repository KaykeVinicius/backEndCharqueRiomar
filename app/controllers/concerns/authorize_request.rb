# app/controllers/concerns/authorize_request.rb
module AuthorizeRequest
  extend ActiveSupport::Concern

  included do
    before_action :authorize_request
  end

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header.present?

    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id])
    rescue => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
