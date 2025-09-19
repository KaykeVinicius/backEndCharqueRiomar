# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  def login
    user = User.find_by(cpf: params[:cpf])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id, role: user.tipo_usuario.descricao })
      render json: { token: token, user: { id: user.id, email: user.email, role: user.tipo_usuario.descricao } }
    else
      render json: { error: "CPF ou senha inválidos" }, status: :unauthorized
    end
  end
end
