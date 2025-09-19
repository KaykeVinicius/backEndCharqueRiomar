class TiposUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: %i[ show update destroy ]

  # GET /tipos_usuarios
  def index
    @tipos_usuarios = TipoUsuario.all

    render json: @tipos_usuarios
  end

  # GET /tipos_usuarios/1
  def show
    render json: @tipo_usuario
  end

  # POST /tipos_usuarios
  def create
    @tipo_usuario = TipoUsuario.new(tipo_usuario_params)

    if @tipo_usuario.save
      render json: @tipo_usuario, status: :created, location: @tipo_usuario
    else
      render json: @tipo_usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipos_usuarios/1
  def update
    if @tipo_usuario.update(tipo_usuario_params)
      render json: @tipo_usuario
    else
      render json: @tipo_usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipos_usuarios/1
  def destroy
    @tipo_usuario.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_usuario
      @tipo_usuario = TipoUsuario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tipo_usuario_params
      params.expect(tipo_usuario: [ :descricao ])
    end
end
