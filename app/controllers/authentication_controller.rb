class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:login]

  # POST /login
  def login
    # Acesse os parâmetros dentro do hash 'user'
    user_params = params.require(:user).permit(:cpf, :password)
    user = User.find_by(cpf: user_params[:cpf])
    
    if user&.authenticate(user_params[:password])
      token = JsonWebToken.encode(user_id: user.id, role: user.tipo_usuario.descricao)
      render json: { 
        token: token, 
        user: { 
          id: user.id, 
          cpf: user.cpf, 
          role: user.tipo_usuario.descricao 
        } 
      }
    else
      render json: { error: "CPF ou senha inválidos" }, status: :unauthorized
    end
  end
end